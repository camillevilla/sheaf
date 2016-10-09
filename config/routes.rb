Rails.application.routes.draw do
  devise_for :users
  resources :authors
  resources :works
  root "demo#welcome"
end
