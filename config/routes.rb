Rails.application.routes.draw do
  get '/pages', to: 'pages#index'
  get '/pages/about', to: 'pages#about'

  root "pages#index"

  get '/about', to: 'pages#about'

  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  resources :goals do
    resources :sub_goals
  end

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
