class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @products = @genre.products.where(is_active: true)
    @products_page = @genre.products.where(is_active: true).page(params[:page]).per(8)
  end
end
