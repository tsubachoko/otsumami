Rails.application.routes.draw do
  
  get 'users/show'
  root 'items#index'
  
  resources :pairings, only: [:index, :show]
  resources :drinks, only: [:index, :show]
  resources :foods, only: [:index, :show]

  resources :users

end
