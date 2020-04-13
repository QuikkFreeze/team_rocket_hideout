# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pokemon#index'

  get 'typing', to: 'typing#index', as: 'typings'
  get 'typing/:id', to: 'typing#show', id: /\d+/, as: 'typing'

  get 'pokemon', to: 'pokemon#index', as: 'pokemons'
  get 'pokemon/:id', to: 'pokemon#show', id: /\d+/, as: 'pokemon'
  get 'pokemon/new_pokemon', to: 'pokemon#new_pokemon', as: 'new_pokemon'
  get 'pokemon/updated_pokemon', to: 'pokemon#updated_pokemon', as: 'updated_pokemon'

  resources :addresses

  get 'cart', to: 'cart#show', as: 'cart'
  post 'update_quantity/:id', to: 'cart#update_quantity', as: 'update_quantity'
  post 'add_to_cart/:id', to: 'pokemon#add_to_cart', as: 'add_to_cart'
  delete 'remove_from_cart/:id', to: 'pokemon#remove_from_cart', as: 'remove_from_cart'

  get 'search', to: 'pokemon#search', as: 'search'

  get ':slug', to: 'page#slug', as: 'slug'
end
