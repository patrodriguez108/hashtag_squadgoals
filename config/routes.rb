Rails.application.routes.draw do
  root to: "application#index"

  get '/about', to: 'application#about'

  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  resources :goals

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }

  resources :users

  resources :tags

  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
