# frozen_string_literal: true

class Page < ApplicationRecord
  validates :slug, format: { with: /\A[^ ]+\z/,
                             message: 'No spaces allowed' }
end
