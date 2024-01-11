Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "my_restaurants", to: "restaurants#my_restaurants", as: :my_restaurants

  resources :restaurants do
    resources :plates, only: %i[new create index]
  end

  resources :plates, only: %i[show edit update]

  delete "plates/:id", to: 'plates#destroy', as: :delete_plate
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :selectedplates, only: %i[create destroy]
  resources :carts, only: %i[show update index]

  # Defines the root path route ("/")
  # root "posts#index"
end
