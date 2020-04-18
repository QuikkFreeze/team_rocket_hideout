# frozen_string_literal: true

class Stripe::ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    event = Stripe::Event.retrieve(params[:id])
    ChargeSuccess.new(event: event).process
    head :ok
  rescue Stripe::APIConnectionError, Stripe::StripeError
    head :bad_request
  end
end
