# frozen_string_literal: true

class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all.order(:dex_id)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
