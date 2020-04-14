# frozen_string_literal: true

class CartController < ApplicationController
  def show
    @pokemons = Pokemon.find(session[:cart].keys)

    sub_total
  end

  def update_quantity
    if params[:quantity].present?
      id = params[:id].to_s
      session[:cart][id] = params[:quantity].to_i
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def sub_total
    @sub_total = 0
    @pokemons.each do |pokemon|
      quantity = session[:cart][pokemon.id.to_s]
      @sub_total += (pokemon.price * quantity)
    end
  end
end
