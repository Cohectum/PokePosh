class Order < ApplicationRecord
  has_many :custom_products
  has_one :shipment
  belongs_to :customer
end
