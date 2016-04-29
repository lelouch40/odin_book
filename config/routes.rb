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
  resources :comments
end
resources :relationships, only: [:create, :destroy]
match ":controller(/:action(/:id))", :via => [:get,:post]
end