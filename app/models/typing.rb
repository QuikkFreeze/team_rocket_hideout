# frozen_string_literal: true

class Typing < ApplicationRecord
  has_many :pokemon_typings
  has_many :pokemons, through: :pokemon_typings

  validates :name, :description, :color_class, presence: true
  validates :name, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,
                                               message: 'only allows letters' }
end
