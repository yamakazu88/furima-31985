Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'items/search' => 'items#search'
  resources :items do
    resources :logs,     only: [:index, :create]
    resources :comments, only: [:create]
    resources :favorites,only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
end
