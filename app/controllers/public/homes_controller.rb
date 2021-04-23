class Public::HomesController < ApplicationController
  def top
    @new_product = Product.where(is_active: true).last(4)
    
  end

  def about
  end
end
