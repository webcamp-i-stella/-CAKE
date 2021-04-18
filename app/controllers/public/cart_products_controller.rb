class Public::CartProductsController < ApplicationController
  def index
    @cart_products = current_customer.cart_products.all
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_product.update(cart_product_params)
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

private
  def cart_product_params
    params.require(:cart_product).permit(:cart_count, :product_id)
  end
end
