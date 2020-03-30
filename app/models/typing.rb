# frozen_string_literal: true

class Typing < ApplicationRecord
  has_many :pokemon_typings
  has_many :pokemons, through: :pokemon_typings
end
