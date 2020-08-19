Rails.application.routes.draw do
  
  root 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pairings, only: [:index, :show]
  resources :drinks, only: [:index, :show]
  resources :foods, only: [:index, :show]

  resources :users

end
