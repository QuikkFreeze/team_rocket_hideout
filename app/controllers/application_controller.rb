# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :all_types

  def all_types
    @all_types = Typing.all
  end
end
