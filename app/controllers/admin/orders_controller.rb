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
    @order.update(order_status_params)
    redirect_to admin_order_path(@order)
  end
  
  private
    def order_status_params
      params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
    end
end
