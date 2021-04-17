class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @products = @genre.products
    @products_page = @genre.products.page(params[:page]).per(8)
  end
end
