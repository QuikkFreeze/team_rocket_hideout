# frozen_string_literal: true

class TypingController < ApplicationController
  def index
    @typings = Typing.all
  end

  def show
    @typing = Typing.find(params[:id])
    @pokemons = Pokemon.includes(:typings)
                       .where('typings.id = ?', params[:id])
                       .references(:typings)
  end
end
