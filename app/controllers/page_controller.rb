# frozen_string_literal: true

class PageController < ApplicationController
  def slug
    @page = Page.find_by(slug: params[:slug])

    redirect_to root_path if @page.nil?
  end
end
