Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items
  resources :items do
    resources :orders, only: :create
    collection do
      get 'search'
    end
  end
#  resources :users, only: :show
  end


