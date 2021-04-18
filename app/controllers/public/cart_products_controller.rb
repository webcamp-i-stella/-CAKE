class Public::CartProductsController < ApplicationController
  def index
    @cart_products = current_customer.cart_products.all
  end

  def update
    @cart_product.update
    render :index
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
  end

  def destroy_all
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy_all
  end

  def create
  end
end
