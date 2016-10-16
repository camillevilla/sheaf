Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:'users/registrations', sessions: 'users/sessions' }
  
  resources :users do
    resources :copies
  end

  resources :authors
  resources :works
  resources :publishers
  resources :editions
  
  root "demo#welcome"
end
