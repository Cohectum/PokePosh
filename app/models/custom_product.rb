class CustomProduct < ApplicationRecord
  belongs_to :product
  belongs_to :character
  has_many :order_products
end
