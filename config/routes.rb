Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  resources :users, except: [:index] do 
    resources :patients, only: [:new, :create, :show, :edit, :update]
  end 

  # resources :patients, except: [:new, :create] 
  resources :doctors # '/users/:user_id/doctors/new'

  resources :healthcare_teams 

  resources :admin do 
    resources :users, only: [:index, :destroy]
  end 
end