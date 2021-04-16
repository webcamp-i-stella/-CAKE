class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.save!
    redirect_to shipping_addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
  end

end
