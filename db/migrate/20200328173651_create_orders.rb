class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer_id, null: false, foreign_key: true
      t.datetime :order_date
      t.decimal :total_cost
      t.string :status

      t.timestamps
    end
  end
end
