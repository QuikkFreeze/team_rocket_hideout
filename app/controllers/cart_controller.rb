# frozen_string_literal: true

class CartController < ApplicationController
  def show
    @pokemons = Pokemon.find(session[:cart].keys)

    sub_total
  end

  def update_quantity
    if params[:quantity].present?
      id = params[:id].to_s
      session[:cart][id] = params[:quantity].to_i
    end

    redirect_back(fallback_location: root_path)
  end

  def checkout
    @pokemons = Pokemon.find(session[:cart].keys)
    @address = current_user.address

    sub_total
    taxes
    total
  end

  def process_order
    checkout

    purchase_items = []

    @ord = Order.create(
      customer_id: @address.id,
      order_date: DateTime.now,
      total_cost: @total,
      total_tax: @taxes,
      status: 'Unpaid'
    )

    if @ord.errors.any?
      @ord.errors.full_messages.each do |message|
        puts message
      end
    else

      @pokemons.each do |poke|
        qty = session[:cart][poke.id.to_s]

        po = PokemonOrder.create(pokemon: poke, order: @ord, quantity: qty, price: poke.price)

        price_cents = (po.price * 100).round

        p_order = {
          name: poke.name,
          description: poke.description,
          amount: price_cents,
          currency: 'cad',
          quantity: qty
        }

        purchase_items << p_order
      end

      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: purchase_items,
        success_url: checkout_success_url,
        cancel_url: checkout_cancel_url,
        client_reference_id: @ord.id
      )

      respond_to do |format|
        format.js
      end

      session[:cart] = {}
    end
  end

  def cancel; end

  def success; end

  private

  def sub_total
    @sub_total = 0
    @pokemons.each do |pokemon|
      quantity = session[:cart][pokemon.id.to_s]
      @sub_total += (pokemon.price * quantity)
    end
  end

  def taxes
    @total_gst = 0
    @total_pst = 0
    @total_hst = 0
    tax_rate = 0

    if @address.province.hst_rate == 0
      tax_rate += @address.province.gst_rate
      @total_gst = (@sub_total * @address.province.gst_rate).round(2)

      tax_rate += @address.province.pst_rate
      @total_pst = (@sub_total * @address.province.pst_rate).round(2)
    else
      tax_rate = @address.province.hst_rate
      @total_hst = (@sub_total * @address.province.hst_rate).round(2)
    end

    @taxes = (@sub_total * tax_rate).round(2)
  end

  def total
    @total = (@sub_total + @taxes).round(2)
  end
end
