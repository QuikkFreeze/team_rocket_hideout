class AddSlugToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :slug, :string
  end
end
