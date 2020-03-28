# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_and_belongs_to_many :types

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders
end
