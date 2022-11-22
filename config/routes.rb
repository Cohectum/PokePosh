Rails.application.routes.draw do
  get 'cart' => 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  get '/products/search'
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :characters
  resources :products
  # resources :shipments
  # resources :orders
  # resources :customers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end

