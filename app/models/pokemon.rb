# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_typings
  has_many :typings, through: :pokemon_typings

  has_one_attached :sprite

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders
end
