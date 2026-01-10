Rails.application.routes.draw do
  root "home#index"

  resources :dishes do
    resources :cook_logs, only: [ :new, :create, :edit, :update, :destroy ]
  end
end
