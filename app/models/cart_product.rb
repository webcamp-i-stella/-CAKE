class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    validates :cart_count, presence: true
end
