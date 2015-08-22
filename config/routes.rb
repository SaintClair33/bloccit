Rails.application.routes.draw do

  devise_for :users
  #the resources method lets you restrict which RESTful routes you want
  resources :users, only: [:update, :show, :index] #creates new action users#update

  
  resources :topics do
    resources :posts, except: [:index], controller: 'topics/posts' do
      resource  :summaries, only: [:create, :show] # use singular resource when you dont need an ID to look it up
    end
  end

  resources :posts, only: [:index] do # the [] we dont want to create any /posts/:id routes just posts/:post_id/comments
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end   
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end

