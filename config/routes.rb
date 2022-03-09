Rails.application.routes.draw do
  get 'quotes_controller/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/quotes', to: 'quotes#create'
end
