Rails.application.routes.draw do
  root to: "application#index"

  get '/about', to: 'application#about'

  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  get '/goals/new', to: 'goals#new', as: 'new_goal'
  post '/goals', to: 'goals#create'

  devise_for :users

  resources :users, only: [:show]

  resources :tags
end
