Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  root 'users#show'

  get 'users/', to: 'users#new'
  post 'users/', to: 'users#create'
  get 'users/show', to: 'users#show'
  get '/logout', to: 'users#logout'

  # get '/signin', to: 'users#signin_new'
  # post '/signin', to: 'users#signin'


  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
