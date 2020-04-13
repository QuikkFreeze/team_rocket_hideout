class AddUserRefToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :user, null: true, foreign_key: true
  end
end
