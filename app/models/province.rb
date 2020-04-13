# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :addresses

  validates :name, :pst_rate, :gst_rate, :hst_rate, presence: true
  validates :pst_rate, :gst_rate, :hst_rate, numericality: true
  validates :name, format: { with: /\A[a-zA-Z\sé-]*\z/,
                             message: 'only allows letters' }
end
