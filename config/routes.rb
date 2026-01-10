Rails.application.routes.draw do
  root "home#index"


  resources :dishes, except: [ :show ]
end
