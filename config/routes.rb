Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:'users/registrations', sessions: 'users/sessions' }
  
  authenticate :user do
    resources :users do
      resources :copies
      resources :friendships
    end
    resources :authors
    resources :works
    resources :publishers
    resources :editions
    resources :friendrequests
  end
  
  root "demo#welcome"
end
