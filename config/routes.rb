Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Omniauth GitHub route
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]

  resources :users, except: [:index]  
   
  resources :patients, only: [:new, :create, :show, :edit, :update] do
    resources :healthcare_teams, only: [:index, :new, :create, :show]
  end

  get '/select_specialty', to: 'healthcare_teams#select_specialty'
  post '/patients/:patient_id/healthcare_teams/new', to: 'healthcare_teams#new'

  # resources :patients, except: [:new, :create] 
  resources :doctors # '/users/:user_id/doctors/new'
  post '/doctors', to: 'doctors#index'
  
  # get '/select_doctor', to: 'doctors#select_doctor'


  resources :admin do 
    resources :users, only: [:index, :destroy]
  end 
end