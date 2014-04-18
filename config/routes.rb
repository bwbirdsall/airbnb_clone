GlobalFriends::Application.routes.draw do
  devise_for :users

  resources :properties do
    resources :reviews
  end
  resources :users, only: [:index, :show, :update]

  resources :reviews

  resources :pictures, only: [:show, :destroy, :update]


  root to: 'properties#index'
end
