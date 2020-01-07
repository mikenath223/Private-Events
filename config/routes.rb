Rails.application.routes.draw do
  root 'users#show'

  get 'users/', to: 'users#new' 
  post 'users/', to: 'users#create'
  get 'users/show', to: 'users#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
