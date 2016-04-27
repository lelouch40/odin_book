Rails.application.routes.draw do
  devise_for :users
  resource :users
  root 'posts#index'
resources :comments
resources :posts do
  resources :comments
end
        match ":controller(/:action(/:id))", :via => [:get,:post]
end