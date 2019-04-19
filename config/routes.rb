Rails.application.routes.draw do
  # Webの世界(HTTP)とRailsの世界の２つのインターフェース
  
  root to: "tasks#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  post "signup", to: "users#create"
  
  resources :tasks
end
