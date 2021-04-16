class Public::OrdersController < ApplicationController
      
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end
  
  def index
  end

  def show
  end
   private
  
  def order_params
    params.require(:order).permit(:order_postal_code,:order_address,:order_name,:payment_method)
  end
 
  
end
