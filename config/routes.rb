Rails.application.routes.draw do
  
  # resources :usuarios
  
  root 'sessions#new'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/register' => 'usuarios#new'
  post '/register' => 'usuarios#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
