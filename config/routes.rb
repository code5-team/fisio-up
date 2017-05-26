Rails.application.routes.draw do
  
  # resources :usuarios

  root 'sessions#new'

  resources 'usuarios'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
