class RemoveImageFromPokemon < ActiveRecord::Migration[6.0]
  def change

    remove_column :pokemons, :image, :string
  end
end
