Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show]

  resources :trips, only: [:index, :new, :create, :show] do
    resources :activities, only: [:index, :edit]
  end

  resources :activities, only: [:update] do
    resources :notes, only: [:create]
  end
end
