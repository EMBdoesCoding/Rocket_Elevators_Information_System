Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # devise_for :users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'quotes_controller/create'
  post '/quote', to: 'quotes#create'

  #route to home page, commercial,residential, and quote
  root to: 'pages#index'
  get '/residential', to: 'pages#residential'
  get '/commercial', to: 'pages#commercial'
  get '/quote', to: 'pages#quote'

  get '/login', to: 'pages#quote'

  
end