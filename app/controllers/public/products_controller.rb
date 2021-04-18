class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_active: true)
    @products_page = Product.where(is_active: true).page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
   @product = Product.find(params[:id])
   @cart_product = CartProduct.new
  end
  
end
