# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_many :pokemon_typings
  has_many :typings, through: :pokemon_typings
  accepts_nested_attributes_for :pokemon_typings, allow_destroy: true

  has_one_attached :image

  has_many :pokemon_orders
  has_many :orders, through: :pokemon_orders

  validates :name, :dex_id, :species, :height, :weight,
            :description, :price, presence: true
  validates :name, :species, :description, length: { minimum: 2}
  validates :price, numericality: true
  validates :dex_id, numericality: { only_integer: true }
  validates :name, :species, format: { with: /\A[a-zA-Z]+\z/,
                                       message: 'only allows letters' }
end
