class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @order.order_details.build
  end

  def confirm
    @order = current_customer.orders.build(order_params)
    @cart_products = current_customer.cart_products
    if @order.save(validate: false)
      @cart_products.destroy_all
    end
    # @order_detail = @order.order_details.build(product_id: product.id) <= どのproduct？？
    # @order_detail.save
    redirect_to "/orders/complete"
  end

  def complete
  end

  def create
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.order_postal_code = current_customer.postal_code
      @order.order_address = current_customer.address
      @order.order_name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      current_customer.shipping_addresses.each do |shipping_address|
        @order.order_postal_code = shipping_address.postal_code
        @order.order_address = shipping_address.address
        @order.order_name = shipping_address.name
      end
    elsif params[:order][:address_option] == "2"
      @order.order_postal_code = params[:order][:order_postal_code]
      @order.order_address = params[:order][:order_address]
      @order.order_name = params[:order][:order_name]
    end

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

  def update
    @order = Order.find(params[:id])
    @order.update(validate: false)
    redirect_to admin_order_path(@order)
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
                                  order_details_attributes: [:order_count])
  end                               
  # def order_status_params
  #     params.require(:order).permit(:order_status).merge(order_status: params[:order][:order_status].to_i)
  # end
end

