# frozen_string_literal: true

ActiveAdmin.register Address do
  permit_params :name, :email, :address, :city, :province_id, :username, :encrypted_password, :salt
end
