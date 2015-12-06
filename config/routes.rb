Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  resources :messages, except: [:new, :create]
  resources :posts do
    resources :messages, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]
end
