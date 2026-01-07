Rails.application.routes.draw do
  get "dishes/index"
  get "dishes/new"
  # devise_for :users

  root "home#index"

  resources :dishes, only: [ :index, :new, :create ]
end
