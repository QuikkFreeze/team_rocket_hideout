# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update]

  # GET /tests/1
  # GET /tests/1.json
  def show; end

  # GET /tests/new
  def new
    @address = Address.new
    @provinces = Province.all.order(:name)
  end

  # GET /tests/1/edit
  def edit; end

  # POST /tests
  # POST /tests.json
  def create
    @address = Address.new(address_params)
    @provinces = Province.all.order(:name)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:name, :address, :city, :province_id, :user_id)
  end
end
