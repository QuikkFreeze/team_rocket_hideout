# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer

  has_many :pokemon_orders
  has_many :pokemons, through: :pokemon_orders
end
