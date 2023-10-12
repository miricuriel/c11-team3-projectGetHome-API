Rails.application.routes.draw do
  devise_for :users
  resources :user_property_rents
  resources :user_property_sales
  resources :property_for_rents
  resources :property_for_sales
  resources :properties
  resources :property_types
  resources :users
  resources :roles
  resources :property_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
