Rails.application.routes.draw do


  get 'comments/create'

  devise_for :users

  #resources :posts
  #resources :topics
  #the resources method lets you restrict which RESTful routes you want
  resources :users, only: [:update] #creates new action users#update
  resources :topics do
    resources :posts, except: [:index] do
      resource :summaries, only: [:create, :show]
      resource :comments, only: [:create]
    end

  end
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end

