Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Omniauth GitHub route
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]

  resources :users, except: [:index]  
   
  resources :patients, only: [:new, :create] do
    resources :healthcare_teams, only: [:index, :new, :create, :show]
  end

  # Patient Main Page 
  get '/homepage', to: 'application#homepage'

  # Customized for doctors specialty filter
  get '/select_specialty', to: 'healthcare_teams#select_specialty'
  post '/patients/:patient_id/healthcare_teams/new', to: 'healthcare_teams#new'

  resources :doctors, only: [:index] 

  resources :admin do 
    resources :users
    resources :patients
    resources :doctors 
    resources :healthcare_teams
  end 
end