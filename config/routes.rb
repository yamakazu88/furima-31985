Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'items/search' => 'items#search'
  resources :items do
    resources :logs,     only: [:index, :create]
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] 
end
