# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pokemon#index'

  get 'page/show'
  get 'typing', to: 'typing#index', as: 'typings'
  get 'typing/:id', to: 'typing#show', id: /\d+/, as: 'typing'
  # resource 'pokemons', only: %i[index show]
  get 'pokemon', to: 'pokemon#index', as: 'pokemons'
  get 'pokemon/:id', to: 'pokemon#show', id: /\d+/, as: 'pokemon'

  get 'search', to: 'pokemon#search', as: 'search'
end
