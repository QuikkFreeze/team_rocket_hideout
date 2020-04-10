# frozen_string_literal: true

class CartController < ApplicationController
  def show
    @pokemons = Pokemon.find(session[:cart])

    sub_total
  end

  private

  def sub_total
    @sub_total = 0
    @pokemons.each do |pokemon|
      @sub_total += pokemon.price
    end
  end
end
