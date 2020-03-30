# frozen_string_literal: true

class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:dex_id)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    @pokemons = Pokemon.where('pokemons.name LIKE ? OR pokemons.description LIKE ?',
                              "%#{params[:search_term]}%", "%#{params[:search_term]}%")

    unless params[:selected_type].empty?
      @type = Typing.find_by(id: params[:selected_type])

      @pokemons = @pokemons.includes(:typings)
                           .where('typings.id = ?', params[:selected_type])
                           .references(:typings)
    end
  end
end
