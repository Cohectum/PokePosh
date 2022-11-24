class CustomProduct < ApplicationRecord
  belongs_to :product
  belongs_to :character
  has_many :order_products
  has_many :carts, through: :order_products

  validates :id, numericality: true
end
