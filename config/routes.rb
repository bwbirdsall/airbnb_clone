GlobalFriends::Application.routes.draw do
  devise_for :users

  resources :properties
  root to: 'properties#index'
end
