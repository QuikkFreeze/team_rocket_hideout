# frozen_string_literal: true

class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all.includes(:typings).order(:dex_id).page(params[:page])
  end

  def show
    @pokemon = Pokemon.find(params[:id])
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

  def new_pokemon
    @pokemons = Pokemon.where(created_at: 3.days.ago..Time.current).page(params[:page])
  end

  def updated_pokemon
    @pokemons = Pokemon.where(updated_at: 3.days.ago..Time.current)
                       .where.not(created_at: 3.days.ago..Time.current).page(params[:page])
  end

  def add_to_cart
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i

    session[:cart].delete(id)
    redirect_back(fallback_location: root_path)
  end
end
