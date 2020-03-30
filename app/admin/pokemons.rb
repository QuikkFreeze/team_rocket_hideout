# frozen_string_literal: true

ActiveAdmin.register Pokemon do
  permit_params :name, :dex_id, :species, :height, :weight, :description, :price, :image, typings: []

  index do
    selectable_column
    id_column
    column :name
    column :dex_id, label: 'Dex Id'
    column :price
    column :species
    column :height
    column :weight
    column :description
    column :typings do |pokemon|
      table_for pokemon.typings do
        column(&:name)
      end
    end
    column :image
  end

  show do
    attributes_table do
      row :name
      row :dex_id, label: 'Dex Id'
      row :price
      row :species
      row :height
      row :weight
      row :description
      table_for pokemon.typings do
        column 'Types' do |typing|
          link_to typing.name, [:admin, typing]
        end
      end
    end
  end

  form do |f|
    f.inputs  do
      f.input :name
      f.input :dex_id, label: 'Dex Id'
      f.input :price
      f.input :species
      f.input :height
      f.input :weight
      f.input :description
      f.inputs do
        f.input :image, as: :file
      end
    end
    f.actions
  end
end
