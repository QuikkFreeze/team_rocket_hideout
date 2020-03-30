# frozen_string_literal: true

ActiveAdmin.register Typing do
  permit_params :name, :description, :color_class

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :color_class, as: :string
      f.actions
    end
  end
end
