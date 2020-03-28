# frozen_string_literal: true

class CreatePokemonsTypesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table(:pokemons, :types)
  end
end
