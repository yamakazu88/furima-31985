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

  get  'contacts'         => 'contacts#index'   #入力画面
  post 'contacts/confirm' => 'contacts#confirm' #確認画面
  post 'contacts/thanks'  => 'contacts#thanks'  #送信完了画面
  
end
