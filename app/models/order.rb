class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    
    enum payment_method: {クレジットカード:1, 現金:2}
end
