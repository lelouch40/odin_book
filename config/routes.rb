Rails.application.routes.draw do
    root 'posts#index'
  devise_for :users
  resources :users do
  	    member do
  get :following, :followers
    get :delete
end
end
resources :friendships do
member do
    put 'friend_request'
    put 'friend_request_accept'
    delete 'friend_request_reject'
    get :delete
end
end
resources :comments 
resources :posts do
  post 'like', to: 'posts#like'
    post 'unlike',  to: 'posts#unlike'
  resources :comments
end
resources :relationships, only: [:create, :destroy]
match ":controller(/:action(/:id))", :via => [:get,:post]
end