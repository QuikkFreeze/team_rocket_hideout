# frozen_string_literal: true

ActiveAdmin.register Pokemon do
  permit_params :name, :dex_id, :species, :height, :weight, :description, :price, :image, :sprite, type_ids: []

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
    column :types do |pokemon|
      table_for pokemon.types do
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
      table_for pokemon.types do
        column 'Types' do |type|
          link_to type.name, [:admin, type]
        end
      end
    end
  end

  form do |f|
    f.inputs 'Add/Edit Pokemon' do
      f.input :name
      f.input :dex_id, label: 'Dex Id'
      f.input :price
      f.input :species
      f.input :height
      f.input :weight
      f.input :description
      f.input :types, as: :select, label: 'Primary Type', input_html: { multiple: false }
      f.input :types, as: :select, label: 'Secondary Type', input_html: { multiple: false }, include_blank: true
      f.input :image
      f.inputs do
        f.input :sprite, as: :file
      end
    end
    f.actions
  end
end
