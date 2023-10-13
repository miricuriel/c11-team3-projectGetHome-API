Rails.application.routes.draw do

  resources :properties
  resources :user_property_sales, only: %i[index create]
  resources :user_property_rents, only: %i[index create]

  resources :users, only: :create do
    resources :property_users, only: [:show, :create, :index]
  end
  
  post "/signup", to: "users#create"

  get "/profile", to: "users#show"
  get "/show_properties", to: "users#show_properties"
  patch "/profile", to: "users#update"
  
  get "/properties", to: "properties#index"
  get "/properties/:id", to: "properties#show"
  
  resources :users, only: [:show]  do
    resources :properties, only: %i[update destroy show index]

    resources :property_users

    resources :user_property_sales

  end
 
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy" 
end
