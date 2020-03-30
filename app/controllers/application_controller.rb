# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :all_types

  def all_types
    @all_types = Type.all
  end
end
