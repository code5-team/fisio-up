Rails.application.routes.draw do
  
  # resources :usuarios

  root 'sessions#new'

  #resources 'usuarios'
  
  match 'login' => 'sessions#new', via: 'get'
  match 'login' => 'sessions#create', via: 'post'
  
  
  match 'register' => 'usuarios#new', via: 'get'
  match 'register' => 'usuarios#create', via: 'post'
  match 'register/:id' => 'usuarios#show', via: 'get'
  
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
