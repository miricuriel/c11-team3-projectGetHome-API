Rails.application.routes.draw do
  
  post "/signup", to: "users#create"
  get "/profile", to: "users#show"
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
