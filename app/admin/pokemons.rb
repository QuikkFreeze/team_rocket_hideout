# frozen_string_literal: true

ActiveAdmin.register Pokemon do
  permit_params :dex_id, :name, :species, :height, :weight, :description, :price, :image
end
