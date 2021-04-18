class Product < ApplicationRecord
    has_many :cart_products,dependent: :destroy
    belongs_to :customer
    has_many :order_details
    belongs_to :genre
    attachment :image
end
