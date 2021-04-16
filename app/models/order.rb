class Order < ApplicationRecord
    belongs_to :customer, optional: true
    has_many :order_details

    enum payment_method: {クレジットカード:1, 現金:2}
    
    # validates_acceptance_of :confirming
    # after_validation :check_confirming
 
    # def check_confirming
    #   errors.delete(:confirming)
    #   self.confirming = errors.empty? ? '1' : ''
    # end
    
    array = []
    CartProduct.all.each do |p|
    array << p.product.no_tax_price * 1.1

    end

    @total_price = array.sum 
end
