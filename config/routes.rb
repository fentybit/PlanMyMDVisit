Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Omniauth GitHub and Google route
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  # Only Admin can see Users Index
  resources :users, except: [:index]  
   
  # Patients access to web application
  resources :patients, only: [:new, :create, :show] do
    resources :healthcare_teams, only: [:index, :new, :create, :show]
  end

  # Customized url to filter Doctors Specialty
  get '/select_specialty', to: 'healthcare_teams#select_specialty'
  post '/patients/:patient_id/healthcare_teams/new', to: 'healthcare_teams#new'

  # Patients can only view Doctors' Index and Show Page
  resources :doctors, only: [:index, :show] 

  # Admin privileges
  namespace :admin do 
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :patients, only: [:edit, :update]
    resources :doctors, only: [:edit, :update]
    resources :healthcare_teams, only: [:edit, :update, :destroy]
  end 
end