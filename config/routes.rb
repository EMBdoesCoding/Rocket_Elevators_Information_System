Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
    
  
  #route to home page, commercial,residential, and quote
  get '/index', to: 'pages#index'
  get '/residential', to: 'pages#residential'
  get '/commercial', to: 'pages#commercial'
  get '/quote', to: 'pages#quote'



end
