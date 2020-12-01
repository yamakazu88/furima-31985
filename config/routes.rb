Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :logs, only: [:index, :create]
  end
  resources :users, only: [:show] 
end
