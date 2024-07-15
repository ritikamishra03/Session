Rails.application.routes.draw do
  # devise_for :admins
  
  get 'users/new'
  get 'users/create'
  # get 'sessions/new'
  # get 'sessions/create'
  get 'sessions/destroy'
  # get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "homes#index"
  root "users#new"
  get 'signup', to:"users#new"
  post 'signup', to:"users#create"

  get 'login', to:"sessions#new"
  post 'login', to:"sessions#create"
  get 'logout', to:"sessions#destroy"

  get 'home', to:"homes#index"

end
