# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :all_types
  before_action :initialize_session

  def all_types
    @all_types = Typing.all
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
