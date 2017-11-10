Rails.application.routes.draw do
  root to: "application#index"

  get '/about', to: 'application#about'

  devise_for :users

  resources :users, only: [:show]

  resources :tags
end
