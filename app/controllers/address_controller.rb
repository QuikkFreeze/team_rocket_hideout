class AddressController < ApplicationController
  # frozen_string_literal: true

  class AddressController < ApplicationController
    before_action :set_address, only: %i[show edit update]

    def new
      @address = Address.new
    end

    def edit; end

    def show; end

    def create
      @address = current_user.address.new(
        name: params[:name],
        city: params[:city],
        address: params[:address],
        province: params[:province_id]
      )

      respond_to do |format|
        if @address.save
          redirect_back(fallback_location: root_path)
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @address.update(address_params)
          redirect_back(fallback_location: root_path)
        else
          format.html { render :edit }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @test = Test.find(params[:id])
    end
  end
end
