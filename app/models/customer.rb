# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :province

  has_many :orders

  validates :username, :encrypted_password, :salt, presence: true
  validates :username, :email, uniqueness: true
  validates :name, :city, :address, length: { minimum: 2 }
  validates :encryted_password, length: { in: 6..20 }
end
