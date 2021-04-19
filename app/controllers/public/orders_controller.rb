class Public::OrdersController < ApplicationController
      
  def new
    @order = Order.new
    @order_detail = @order.order_details.build
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @order.save(validate: false)
    # @order_detail = @order.order_details.build(product_id: product.id) <= どのproduct？？
    # @order_detail.save
    redirect_to "/orders/complete"
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    if @order.save
    else
        render :new
    end
  end
  
  def index
    @orders = Order.all
    @orders = Order.all.page(params[:page])
  end

  def show
     @order = Order.find(params[:id])
  end
  
  
  # def order_detail_params
  #   params.require(:order_detail).permit(:order_count,:tax_price)
  # end
  
  def order_params
    params.require(:order).permit(:order_postal_code,
                                  :order_address,
                                  :order_name,
                                  :payment_method,
                                  :customer_id,
                                  :shipping_fee,
                                  :confirming,
                                  order_detail_attributes: [:order_count])
  end                               
end

