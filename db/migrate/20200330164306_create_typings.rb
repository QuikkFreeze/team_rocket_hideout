class CreateTypings < ActiveRecord::Migration[6.0]
  def change
    create_table :typings do |t|
      t.string :name
      t.text :description
      t.string :color_class

      t.timestamps
    end
  end
end
