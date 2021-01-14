Rails.application.routes.draw do
  root "pictures#index"
  devise_for :users
  resources :pictures

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
