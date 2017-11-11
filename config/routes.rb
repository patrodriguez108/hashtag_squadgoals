Rails.application.routes.draw do
  root to: "application#index"

  get '/about', to: 'application#about'

  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  resources :goals

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  resources :users, only: [:show]

  resources :tags


end
