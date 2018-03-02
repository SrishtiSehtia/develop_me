Rails.application.routes.draw do
  root "main#home"
  get '/about',to: "main#about"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  resources :users do
    resources :questions
  end

end
