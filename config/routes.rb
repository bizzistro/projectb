Rails.application.routes.draw do
  resources :posts
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
