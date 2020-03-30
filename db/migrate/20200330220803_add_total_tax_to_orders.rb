class AddTotalTaxToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total_tax, :decimal
  end
end
