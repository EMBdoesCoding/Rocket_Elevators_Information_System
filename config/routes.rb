Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
    
  
  #route to home page, commercial,residential, and quote
  get 'index' => 'pages#index'
  get 'residential' => 'pages#residential'
  get 'commercial' => 'pages#commercial'
  get 'quote' => 'pages#quote'



end
