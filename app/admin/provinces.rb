# frozen_string_literal: true

ActiveAdmin.register Province do
  permit_params :name, :pst_rate
end
