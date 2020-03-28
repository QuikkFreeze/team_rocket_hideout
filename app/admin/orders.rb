# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :customer_id, :order_date, :total_cost, :status
end
