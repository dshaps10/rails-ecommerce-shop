Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # get 'product/index'

  resources :products
  resources :users
  resources :admins
  resources :sales
  resources :categories
  resources :orders

  get '/admin', to: 'admins#inventory_index'

  get '/checkout', to: 'orders#update'

  get '/order_history', to: 'purchases#index'


  # get '/products/new', to: 'products#new'
  # post '/products', to: 'products#create'

  root 'products#index'

end
