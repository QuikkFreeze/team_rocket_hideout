# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :user
  belongs_to :province

  has_many :orders

  validates :name, :city, :address, presence: true
  validates :name, :city, :address, length: { minimum: 2 }
end
