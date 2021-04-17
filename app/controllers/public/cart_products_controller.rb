class Public::CartProductsController < ApplicationController
  def index
    @cart_products = current_customer.cart_products.all
  end

  def update
    @cart_product.update
    render :index
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
