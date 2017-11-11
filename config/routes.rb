Rails.application.routes.draw do
  get '/pages', to: 'pages#index'
  get '/pages/about', to: 'pages#about'

  root "pages#index"

  get '/about', to: 'pages#about'

  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  resources :goals

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  resources :users, only: [:show, :index] do
    resources :connections
  end

  post '/users/:user_id/connections/accept', to: 'connections#accept'

  resources :tags


end
