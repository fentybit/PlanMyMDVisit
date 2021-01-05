Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  post '/logout', to: 'users#destroy?'

  resources :users 
  # get '/users/new', to: 'users#new', as: 'register' --> register_path
  resources :patients # '/users/:user_id/patients/new'
  resources :doctors # '/users/:user_id/doctors/new'

  resources :healthcare_teams 
  resources :healthcare_providers
end