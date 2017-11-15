Rails.application.routes.draw do
  get '/pages', to: 'pages#index'
  get '/pages/about', to: 'pages#about'

  root "pages#index"

  get '/about', to: 'pages#about'

  get '/visions', to: 'visions#index', as: 'visions'
  get '/visions/new', to: 'visions#new', as: 'new_vision'
  post '/visions', to: 'visions#create'

  patch 'goals/:goal_id/sub_goals/:id', to: 'sub_goals#complete'


  # get 'goals/:goal_id/sub_goals/:id/edit', to: 'sub_goals#update'

  resources :goals do
    resources :sub_goals

  end


  resources :users do
    resources :connections
    resources :collaboration_requests
    resources :collaborations
  end

  get '/projects', to: 'projects#index', as: 'projects'
  get '/projects/:id', to: 'projects#show', as: 'project'
  get '/projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update'

  post '/users/:user_id/connections/accept', to: 'connections#accept'

  get '/users/:user_id/connections/:id/accepted', to: 'connections#accepted', as: 'accepted_connection'

  post '/users/:user_id/connections/decline', to: 'connections#decline'

  resources :tags

  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/users/:user_id/collaboration_requests/:id/accept', to: 'collaboration_requests#accept'

  post '/users/:user_id/collaboration_requests/:id/decline', to: 'collaboration_requests#decline'
  # get '/connect_cronofy', to: 'users#connect_cronofy'
  # get '/disconnect_cronofy', to: 'users#disconnect_cronofy'


end
