class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :dex_id
      t.string :name
      t.string :species
      t.string :height
      t.string :weight
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
