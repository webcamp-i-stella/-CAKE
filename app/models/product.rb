class Product < ApplicationRecord
    has_many :cart_products
    has_many :order_details
    belongs_to :genre
end
