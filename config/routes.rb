Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home', as: 'home'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :projects, only: %i[new create edit update destroy] 

  resources :tasks, only: %i[new create edit update destroy]

  resources :comments, only: %i[new create edit update destroy]
end
