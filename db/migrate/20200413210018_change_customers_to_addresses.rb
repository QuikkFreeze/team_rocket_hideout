# frozen_string_literal: true

class ChangeCustomersToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_table :customers, :addresses
  end
end
