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
    @cart_products = current_customer.cart_products.all
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_cart_count = cart_product.cart_count + @cart_product.cart_count
        cart_product.update_attribute(:cart_count, new_cart_count)
        @cart_product.delete
      end
    end

    if @cart_product.save
      redirect_to cart_products_path
    else
      flash.now[:danger] = "※商品の個数を選択してください"
      render :index
    end

  end

  def update
    @cart_product = CartProduct.find(params[:id])
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
