Rails.application.routes.draw do

  root 'sessions#new'

  match 'login' => 'sessions#new', via: 'get'
  match 'login' => 'sessions#create', via: 'post'
  
  
  match 'register' => 'usuarios#new', via: 'get'
  match 'register' => 'usuarios#create', via: 'post'
  match 'profile' => 'usuarios#show', via: 'get'
  match 'edit' => 'usuarios#edit', via: 'get'
  match 'update' => 'usuarios#update', via: 'post'
  match 'management' => 'usuarios#management', via: 'get'
  
  match 'update_management' => 'usuarios#update_management', via: :post
  
  
  #match '/plantao' => 'plantoes#index', via: 'get' NAO CONSEGUI USAR
  #resources 'plantoes'
  get '/plantoes', to: 'plantoes#index'
  get '/formulas', to: 'formulas#index'

  delete '/logout', to: 'sessions#destroy'
  resources :password_resets, only: [:new, :edit, :create, :update]
  
  #resources :usuarios, :collection => { :edit_management => :post, :update_management => :put }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
