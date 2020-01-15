Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#home', as: 'home'

  resources :projects do
    resources :tasks do
      resources :comments, only: [:create, :destroy]
    end
  end

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
