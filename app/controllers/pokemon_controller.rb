# frozen_string_literal: true

class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all.includes(:typings).order(:dex_id).page(params[:page])
  end

  def show
    @pokemon = Pokemon.friendly.find(params[:id])
  end

  def search
    @pokemons = Pokemon.where('pokemons.name LIKE ? OR pokemons.species LIKE ?',
                              "%#{params[:search_term]}%", "%#{params[:search_term]}%").page(params[:page])

    unless params[:selected_type].empty?
      @typing = Typing.find_by(id: params[:selected_type])

      @pokemons = @pokemons.includes(:typings)
                           .left_joins(:pokemon_typings)
                           .where('pokemon_typings.typing_id = ?', params[:selected_type])
    end
  end
end
