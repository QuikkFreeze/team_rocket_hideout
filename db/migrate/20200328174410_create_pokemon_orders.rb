class CreatePokemonOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_orders do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
