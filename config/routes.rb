Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	    member do
  get :following, :followers
end
end
  root 'posts#index'
resources :comments 
resources :posts do
  post 'like', to: 'posts#like'
    post 'unlike',  to: 'posts#unlike'
  resources :comments
end
resources :relationships, only: [:create, :destroy]
match ":controller(/:action(/:id))", :via => [:get,:post]
end