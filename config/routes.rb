Rails.application.routes.draw do
  
  root 'items#index'
  
  resources :pairings, only: [:index, :show]
  resources :drinks, only: [:index, :show]
  resources :foods, only: [:index, :show]


end
