class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
