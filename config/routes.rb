Rails.application.routes.draw do
  get 'pages/about', as: 'pages_about'
  # Define the root of your application
  root 'home#index'

  # Resourceful routes for facts and jokes
  resources :facts, only: [:index, :show]
  resources :jokes, only: [:index, :show]

  resources :categories do
    resources :jokes, only: :show
  end
  
  resources :jokes, only: [:index, :show] 

  resources :categories, only: [:show] do
    resources :facts, only: [:show]
  end
  
  resources :facts, only: [:show] # If you want to

  resources :jokes, only: [:index, :show] 

  resources :categories, only: [:show] do
    resources :facts, only: [:show]
  end
  
  resources :facts, only: [:show] # If you want to

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
