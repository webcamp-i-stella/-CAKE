class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :orders
         has_many :shipping_adresses
         has_many :cart_products

  validates :postal_code, presence: true
  validates :address, presence: true
end
