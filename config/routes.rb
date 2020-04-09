# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pokemon#index'

  get 'typing', to: 'typing#index', as: 'typings'
  get 'typing/:id', to: 'typing#show', id: /\d+/, as: 'typing'

  get 'pokemon', to: 'pokemon#index', as: 'pokemons'
  get 'pokemon/:id', to: 'pokemon#show', id: /\d+/, as: 'pokemon'
  get 'new_pokemons', to: 'pokemon#new_pokemons', as: 'new_pokemons'
  get 'updated_pokemons', to: 'pokemon#updated_pokemons', as: 'updated_pokemons'

  get 'search', to: 'pokemon#search', as: 'search'

  get ':slug', to: 'page#slug', as: 'slug'
end
