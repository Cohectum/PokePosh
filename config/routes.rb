Rails.application.routes.draw do
  get 'home/About'
  get 'home/Contact'
  get 'cart' => 'cart#show'
  get 'cart/complete'
  post 'cart/add'
  post 'cart/remove'
  get 'cart/checkout' => 'cart#checkout'
  post 'cart/checkout' => 'cart#checkout'
  get '/products/search'
  get 'categories' => 'categories#index'
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :characters
  resources :products
  # resources :shipments
   resources :orders
  # resources :customers

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end

