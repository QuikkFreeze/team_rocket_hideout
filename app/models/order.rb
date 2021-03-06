# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :address, foreign_key: 'customer_id'

  has_many :pokemon_orders, dependent: :destroy
  has_many :pokemons, through: :pokemon_orders

  validates :order_date, :total_cost, :total_tax, :status, presence: true
  validates :total_cost, :total_tax, numericality: true
  validates :status, length: { minimum: 2 }
  validates :status, format: { with: /\A[a-zA-Z]+\z/,
                               message: 'only allows letters' }
end
