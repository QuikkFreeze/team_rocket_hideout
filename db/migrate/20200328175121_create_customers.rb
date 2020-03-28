# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.references :province, null: false, foreign_key: true
      t.string :username
      t.string :encrypted_password
      t.string :salt

      t.timestamps
    end
  end
end
