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

    ord = Order.create(
      customer_id: @address.id,
      order_date: DateTime.now,
      total_cost: @total,
      total_tax: @taxes,
      status: 'Unpaid'
    )

    if ord.errors.any?
      ord.errors.full_messages.each do |message|
        puts message
      end
    end

    @pokemons.each do |poke|
      qty = session[:cart][poke.id.to_s]

      PokemonOrder.create(pokemon: poke, order: ord, quantity: qty, price: poke.price)
    end

    session[:cart] = {}

    redirect_to root_path
  end

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
      @total_gst = @sub_total * @address.province.gst_rate

      tax_rate += @address.province.pst_rate
      @total_pst = @sub_total * @address.province.pst_rate
    else
      tax_rate = @address.province.hst_rate
      @total_hst = @sub_total * @address.province.hst_rate
    end

    @taxes = @sub_total * tax_rate
  end

  def total
    @total = @sub_total + @taxes
  end
end
