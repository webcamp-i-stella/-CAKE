class Public::CartProductsController < ApplicationController
  def index
    @cart_products = current_customer.cart_products.all
    @total_price = 0
    @cart_products.each do |cart_product|
    @total_price += ((cart_product.product.no_tax_price.to_i * 1.1 * (cart_product.cart_count).round(2)).round)
    end
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_products = current_customer.cart_products.all
    @cart_products.each do |cart_product|
    @cart_product = cart_product
   end
   
    @cart_product.update(cart_product_params)
    redirect_to cart_products_path
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    cart_products = current_customer.cart_products.all
    cart_products.destroy_all
    redirect_to cart_products_path
  end

private
  def cart_product_params
    params.require(:cart_product).permit(:cart_count, :product_id)
  end
end
