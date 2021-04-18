class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    
     array = []
    CartProduct.all.each do |p|
    array << p.product.no_tax_price * 1.1

    end

    @total_price = array.sum 
    
end
