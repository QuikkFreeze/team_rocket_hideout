# frozen_string_literal: true

class ChargeSuccess
  def initialize(event: event)
    @stripe_obj = event.data.object
  end

  def process
    order.update_columns(status: 'Paid')
  end

  private

  def order
    id = @stripe_obj.client_reference_id.to_i
    order ||= Order.where(id: id).first
  end
end
