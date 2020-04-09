# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :all_types
  before_action :initialize_session

  def all_types
    @all_types = Typing.all
  end

  private

  def initialize_session
    session[:cart] ||= []
  end
end
