Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  devise_for :users

  resources :projects do
    resources :tasks do
      resources :comments, only: [:create, :destroy]
    end
  end
end
