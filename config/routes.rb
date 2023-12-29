Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/index'
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "authors#index"


  root "books#index"
resources :authors
resources :suppliers
resources :customers do
  resources :orders
end
resources :books do
  resources :reviews, only: [:new, :create, :index, :show]
end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
