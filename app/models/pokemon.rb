# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_typings
  has_many :typings, through: :pokemon_typings
  accepts_nested_attributes_for :pokemon_typings, allow_destroy: true

  has_one_attached :image

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders
end
