class CreatePokemonTypings < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_typings do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :typing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
