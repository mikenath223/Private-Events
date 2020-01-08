Rails.application.routes.draw do
  root 'users#show'

  get 'users/', to: 'users#new'
  post 'users/', to: 'users#create'
  get '/logout', to: 'users#logout'
  resources :users

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
