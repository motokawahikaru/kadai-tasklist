Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  get "users", to:"toppages#index"
  resources :tasks
  resources :users, only: [:show, :new, :create]
end
