# frozen_string_literal: true

class Customer < ApplicationRecord
  belongs_to :province

  has_many :orders
end
