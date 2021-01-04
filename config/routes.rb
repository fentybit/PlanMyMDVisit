Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'application#welcome'
  get '/signup', to: 'sessions#new'
  post '/signup', to: 'sessopms#create'
  get '/login', to: 'users#new?'
  post '/login', to: 'users#create?'
  post '/logout', to: 'users#destroy?'

  resources :users 
  # get '/users/new', to: 'users#new', as: 'register' --> register_path
end