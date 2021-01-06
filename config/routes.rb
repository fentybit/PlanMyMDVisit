Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, except: [:new, :create] do 
    resources :patients, only: [:new]     # '/users/:user_id/patients/new'
  end 

  resources :patients, except: [:new] 
  resources :doctors # '/users/:user_id/doctors/new'

  resources :healthcare_teams 
  resources :healthcare_providers
end