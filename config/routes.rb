Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:'users/registrations', sessions: 'users/sessions' }
  resources :authors
  resources :works
  root "demo#welcome"
end
