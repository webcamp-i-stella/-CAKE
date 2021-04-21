class Admin::OrdersController < ApplicationController
  def index
    case params[:order_sort]
    when "0"
      @orders = Order.all
    when "1"
      @customer = Customer.find_by(params[:customer_id])
      @orders = @customer.orders
    end
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
