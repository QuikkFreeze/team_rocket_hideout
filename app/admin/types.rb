# frozen_string_literal: true

ActiveAdmin.register Type do
  permit_params :name, :description, :color
end
