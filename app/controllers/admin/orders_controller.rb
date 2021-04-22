class Admin::OrdersController < ApplicationController
  def index
    case params[:order_sort]
    when "2"
    @customer = Customer.find_by(params[:customer_id])
     @orders = @customer.orders
    else
      @orders = Order.all
    end
      @orders_page = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    
      @order.order_details.each do |order_detail|
      if 
        @order.order_status == "入金確認"
        order_detail.production_status = "製作待ち"
        order_detail.save
        @order.save
      end
    end
    redirect_to admin_order_path(@order)
  end

  private
    def order_status_params
      params.require(:order).permit(:order_status)
    end

    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
end
