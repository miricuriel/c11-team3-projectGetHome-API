Rails.application.routes.draw do

  resources :user_property_sales, only: %i[index create]
  get "/user/:user_id/property_sale/:property_id", to: "user_property_sales#showUserProperty"
  resources :user_property_rents, only: %i[index create]
  get "/user/:user_id/property_rent/:property_id", to: "user_property_rents#showUserProperty"

  post "/signup", to: "users#create"

  # User favorite
  get "/favorites", to: "favorites#index"

  # User Contacted
  get "/contacted", to: "contacted#index"

  get "/profile", to: "users#show"
  get "/show_properties", to: "users#show_properties"
  patch "/profile", to: "users#update"
  
  get "/properties", to: "properties#index"
  get "/properties/:id", to: "properties#show"
  
  resources :users, only: [:show]  do
    resources :properties, only: %i[update destroy show index]
    resources :property_users
  end
 
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy" 

  #propertiesuser
  get "/user/:user_id/property_user/:property_id", to: "property_users#checkout"
  get "/property_id/:property_id", to: "property_users#showUser"

end
