Rails.application.routes.draw do


  get 'comments/create'

  devise_for :users
  #the resources method lets you restrict which RESTful routes you want
  resources :users, only: [:update] #creates new action users#update

  #resources :topics do
    #resources :posts, except: [:index] do
      #resource :summaries, only: [:create, :show]# use singular resource when you dont need an ID to look it up
      #resources :comments, only: [:create, :destroy]
    #end

  #end
  
  resources :topics do
    resources :posts, except: [:index] do
      resource  :summaries, only: [:create, :show] # use singular resource when you dont need an ID to look it up
    end
  end

  resources :posts, only: [] do # the [] we dont want to create any /posts/:id routes just posts/:post_id/comments
    resources :comments, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end   
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end

