GlobalFriends::Application.routes.draw do
  devise_for :users

  resources :properties
  resources :users, only: :index

  root to: 'properties#index'
end
