class Order < ApplicationRecord
    belongs_to :customer, optional: true
    has_many :order_details, dependent: :destroy
    accepts_nested_attributes_for :order_details


    validates_acceptance_of :confirming, allow_nil: false
    after_validation :check_confirming

    def check_confirming
      errors.delete(:confirming)
      self.confirming = errors.empty? ? '1' : ''
    end

    validates :order_name, presence: true
    validates :order_address, presence: true
    validates :order_postal_code, presence: true
    validates :payment_method, presence: true

    enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}, _prefix: true
    enum payment_method: {クレジットカード:1, 銀行振込:2}, _prefix: true



    array = []
    CartProduct.all.each do |p|
    array << p.product.no_tax_price * 1.1
    end

    @total_price = array.sum
end
