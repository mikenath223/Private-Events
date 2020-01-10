Rails.application.routes.draw do
  root 'events#index'

  get '/logout', to: 'users#logout'
  resources :users
  resources :events

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  get 'events', to: 'events#new'
  post 'events', to: 'events#create'

  get 'attend/:id' => 'events#attend_event', as: :attend

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
