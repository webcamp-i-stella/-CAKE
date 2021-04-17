class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders = Order.all.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update
    redirect_to admin_order_path(@order)
  end
end
