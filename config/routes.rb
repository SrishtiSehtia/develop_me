Rails.application.routes.draw do
  root "users#index"

  get '/login', to: "sessions#new"
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get    '/users'     => 'users#index'
  post   '/users'      =>'users#create'
  get    '/users/new' => 'users#new'
  get    '/users/:id/edit' => 'users#edit'
  get    '/users/:id' =>     'users#show', as: 'user'
  put    '/users/:id' =>     'users#update'
  delete '/users/:id' =>     'users#destroy'


end
