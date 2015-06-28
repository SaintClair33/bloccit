Rails.application.routes.draw do


  get 'comments/create'

  devise_for :users

  #resources :posts
  #resources :topics
  #the resources method lets you restrict which RESTful routes you want
  resources :users, only: [:update] #creates new action users#update
  resources :topics do
    resources :posts, except: [:index] do
      resource :summaries, only: [:create, :show]# use singular resource when you dont need an ID to look it up
      resources :comments, only: [:create, :destroy]
    end

  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end

