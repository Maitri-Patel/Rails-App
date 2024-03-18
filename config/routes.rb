Rails.application.routes.draw do
  get 'pages/about', as: 'pages_about'
  # Define the root of your application
  root 'home#index'

  # Resourceful routes for facts and jokes
  resources :facts, only: [:index, :show]
  resources :jokes, only: [:index, :show]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
