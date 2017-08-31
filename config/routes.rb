Rails.application.routes.draw do
  
  # resources :usuarios

  root 'sessions#new'

  #resources 'usuarios'
  
  match 'login' => 'sessions#new', via: 'get'
  match 'login' => 'sessions#create', via: 'post'
  
  
  match 'register' => 'usuarios#new', via: 'get'
  match 'register' => 'usuarios#create', via: 'post'
  match 'profile' => 'usuarios#show', via: 'get'
  match 'edit' => 'usuarios#edit', via: 'get'
  match 'update' => 'usuarios#update', via: 'post'
  match 'management' => 'usuarios#management', via: 'get'
  
  #match '/plantao' => 'plantoes#index', via: 'get' NAO CONSEGUI USAR
  #resources 'plantoes'
  get '/plantoes', to: 'plantoes#index'

  delete '/logout', to: 'sessions#destroy'
  
  #get '/login' => 'sessions#new'
  #post '/login' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
