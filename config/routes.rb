Rails.application.routes.draw do
  root "users#index"

  get '/login', to: "sessions#new"
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :questions
  end


end
