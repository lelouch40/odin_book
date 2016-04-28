Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	    member do
  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
end
end
  root 'posts#index'
resources :comments do
	  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
end
resources :posts do
  resources :comments
    post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
end
        match ":controller(/:action(/:id))", :via => [:get,:post]
end