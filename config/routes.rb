GlobalFriends::Application.routes.draw do
  devise_for :users

  resources :properties
  resources :users, only: [:index, :show, :update]

  root to: 'properties#index'
end
