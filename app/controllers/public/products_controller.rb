class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(is_active: true).order(id: :DESC)
    @products_page = Product.where(is_active: true).page(params[:page]).per(8).order(id: :DESC)
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

end
