# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'planets#index'

  # The routs of planets
  # get 'planets/index'
  # get 'planets/show'
  resources 'planets', only: %i[index show]

  # The routs of kinds
  # get 'kinds/index'
  resources 'kinds', only: %i[index show]

  # The routs of characters
  # get 'characters/index'
  # get 'characters/:id', to: 'characters#show', id: /\d+/, as: 'character'
  resources 'characters', only: %i[index show]

  # The rout of Starships
  # get 'starships/index'
  # get 'starships/show'
  resources 'starships', only: %i[index show]

  # Generate all 7 RESTful routes
  resources :pages

  get '/p/:permalink', to: 'pages#permalink', as: 'permalink'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
