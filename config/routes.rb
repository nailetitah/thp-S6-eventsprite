Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events, controller: 'events'
  resources :users, only: [:show]
end
