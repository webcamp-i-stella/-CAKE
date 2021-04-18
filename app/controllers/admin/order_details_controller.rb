class Admin::OrderDetailsController < ApplicationController
  def update
    # @order_detail = OrderDetail.find(params[:id]) <= order_detailが保存できるようになるまでコメントアウト
    @order_detail.update
  end
end
