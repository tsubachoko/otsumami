Rails.application.routes.draw do
  
  root 'items#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pairings, only: [:index, :show, :new, :create, :destroy]
  get '/pairings/new/drink', to: 'pairings#new_drink'
  get '/pairings/new/food', to: 'pairings#new_food'

  resources :drinks, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]

  resources :users

end
