# frozen_string_literal: true

class RemoveUserFieldsFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :username, :string
    remove_column :customers, :email, :string
    remove_column :customers, :encrypted_password, :string
    remove_column :customers, :salt, :string
  end
end
