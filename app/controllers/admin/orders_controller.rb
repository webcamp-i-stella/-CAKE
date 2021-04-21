class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders = Order.all.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
   
    @order_detail = @order.order_details.each do |order_detail|
      if order_detail.production_status == "製作中"
          @order.order_status = 2
          @order.order_status.update
      elsif
        @order.order_status == "入金確認"
        order_detail.production_status = "製作待ち"
      elsif
        order_detail.production_status == "製作完了"
        @order.order_status = "発送準備中"
      end
    end
    
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    redirect_to admin_order_path(@order)
  end
  
  private
    def order_status_params
      params.require(:order).permit(:order_status)
    end
end
