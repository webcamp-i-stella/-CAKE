class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products_page = Product.all.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
