class Admin::OrderDetailsController < ApplicationController
  
  
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    
    if @order_detail.production_status == "製作中"
       @order_detail.order.order_status = "製作中"
    elsif
      @order_detail.production_status == "製作完了"
        if OrderDetail.exists?(production_status: "製作中")
           @order_detail.order.order_status = "製作中"
        else
          @order_detail.order.order_status = "発送準備中"
        end
    end
    
    @order_detail.save
    @order_detail.order.save
    redirect_to admin_order_path(@order_detail.order_id)
  end
  
  private
    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end
# <%= form_with model: @order_detail, url:admin_order_detail_path(@order_detail), local: true do |f| %>
# <%= f.select :production_status, [["製作不可",0], ["製作待ち",1], ["製作中",2], ["製作完了",3]] %>     
# <%= f.submit "更新" %>
# <% end %>

#  order_detailが保存できるようになるまでコメントアウト
end
