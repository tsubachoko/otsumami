Rails.application.routes.draw do
  
  root 'items#index'
  
  resources :parings, only: :index
  resources :drinks, only: :index
  resources :foods, only: :index


end
