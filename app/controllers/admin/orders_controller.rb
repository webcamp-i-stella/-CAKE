class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders = Order.all.page(params[:page])
  end
  
  def show
  end

  def update
  end
end
