# frozen_string_literal: true

ActiveAdmin.register Customer do
  permit_params :name, :email, :address, :city, :province_id, :username, :encrypted_password, :salt
end
