# frozen_string_literal: true

class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:dex_id)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    @pokemons = Pokemon.where('pokemons.name LIKE ?',
                              "%#{params[:search_term]}%")

    unless params[:selected_type].empty?
      @type = Type.find_by(id: params[:selected_type])

      @pokemons = pokemons.includes(:types)
                          .where('types.id = ?', params[:selected_type])
                          .references(:types)
    end
  end
end
