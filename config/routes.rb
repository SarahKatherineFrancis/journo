Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show]

  resources :trips, only: [:index, :new, :create] do
    resources :activities, only: [:index, :update]
  end

  resources :activities, only: [:index] do
    resources :notes, only: [:create]
  end
end
