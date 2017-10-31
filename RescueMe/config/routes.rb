Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcomes#index'

resources :users, only: [:new, :create, :destroy]
resources :pets
resources :sessions, only: [:new, :create, :destroy]

get '/login', to: 'sessions#new'
end
