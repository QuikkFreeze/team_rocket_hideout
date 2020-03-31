# frozen_string_literal: true

class TypingController < ApplicationController
  def index
    @typings = Typing.all
  end

  def show
    @typing = Typing.find(params[:id])

    @pokemons = Pokemon.includes(:typings)
                       .left_joins(:pokemon_typings)
                       .where('pokemon_typings.typing_id = ?', params[:id]).page(params[:page])
  end
end
