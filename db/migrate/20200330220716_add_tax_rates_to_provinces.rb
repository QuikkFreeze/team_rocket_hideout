class AddTaxRatesToProvinces < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :gst_rate, :decimal
    add_column :provinces, :hst_rate, :decimal
  end
end
