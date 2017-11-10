Rails.application.routes.draw do
  root to: "application#index"

  get '/about', to: 'application#about'

  get '/goals/new', to: 'goals#new', as: 'new_goal'

  devise_for :users
end
