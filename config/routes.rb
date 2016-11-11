Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:'users/registrations', sessions: 'users/sessions' }
  
  authenticate :user do
    resources :users do
      resources :copies
      resources :friendships
    end
    resources :copies do
      resources :loans
    end
    resources :authors
    resources :works
    resources :publishers
    resources :editions
    resources :friendrequests
    resources :loans
  end
  
  root "demo#welcome"
end
