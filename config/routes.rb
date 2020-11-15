Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  #resources :users, only: [:edit, :update]
  #  resources :rooms, only: [:new, :create, :destroy] do
  #    resources :messages, only: [:index, :create]
   #end
end
