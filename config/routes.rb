Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :properties
  
  resources :users, only: :create do
    resources :property_users, only: [:show, :create, :index]
  end
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"

  # resources :users do
  #   resources :properties
  # end

  # session routes
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy" 
end
