# frozen_string_literal: true

class Pokemon < ApplicationRecord
  has_and_belongs_to_many :types
end
