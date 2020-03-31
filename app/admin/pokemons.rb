# frozen_string_literal: true

ActiveAdmin.register Pokemon do
  permit_params :name, :dex_id, :species, :height, :weight, :description, :price, :image, :slug, pokemon_typings_attributes: %i[id pokemon_id typing_id _destroy]

  index do
    selectable_column
    column :id
    column :name
    column :dex_id, label: 'Dex Id'
    column :price
    column :species
    column :height
    column :weight
    column :description
    column :typings do |pokemon|
      pokemon.typings do |t|
        link_to t.name, [:admin, t]
      end
    end
    column :slug
    actions
  end

  show do |_pokemon|
    attributes_table do
      row :name
      row :dex_id, label: 'Dex Id'
      row :price
      row :species
      row :height
      row :weight
      row :description
      row :typings do |pokemon|
        pokemon.typings do |t|
          link_to t.name, [:admin, t]
        end
      end
      row :slug
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
      f.input :slug
      f.has_many :pokemon_typings, allow_destroy: true do |n_f|
        n_f.input :typing
      end
      f.inputs do
        f.input :image, as: :file
      end
    end
    f.actions
  end
end
