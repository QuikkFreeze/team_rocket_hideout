# frozen_string_literal: true

ActiveAdmin.register Address do
  permit_params :name, :address, :city, :province_id, :user_id
end
