# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pokemon#index'

  get 'typing', to: 'typing#index', as: 'typings'
  get 'typing/:id', to: 'typing#show', id: /\d+/, as: 'typing'

  get 'pokemon', to: 'pokemon#index', as: 'pokemons'
  get 'pokemon/:id', to: 'pokemon#show', id: /\d+/, as: 'pokemon'
  get 'pokemon/new_pokemons', to: 'pokemon#new_pokemons', as: 'new_pokemons'
  get 'pokemon/updated_pokemons', to: 'pokemon#updated_pokemons', as: 'updated_pokemons'

  post 'pokemon/add_to_cart/:id', to: 'pokemon#add_to_cart', as: 'add_to_cart'
  delete 'pokemon/remove_from_cart/:id', to: 'pokemon#remove_from_cart', as: 'remove_from_cart'

  get 'search', to: 'pokemon#search', as: 'search'

  get ':slug', to: 'page#slug', as: 'slug'
end
