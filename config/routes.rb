# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pokemon#index'

  get 'type', to: 'type#index', as: 'types'
  get 'type/:id', to: 'type#show', id: /\d+/, as: 'type'
  # resource 'pokemons', only: %i[index show]
  get 'pokemon', to: 'pokemon#index', as: 'pokemons'
  get 'pokemon/:id', to: 'pokemon#show', id: /\d+/, as: 'pokemon'

  get 'search', to: 'pokemon#search', as: 'search'
end
