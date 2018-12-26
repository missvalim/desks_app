Rails.application.routes.draw do
  
 get 'users/new'
  devise_for :users
  resources :users
  root 'posts#index'
  resources :posts do
  	resources :comments
  end
  resources :tags, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
