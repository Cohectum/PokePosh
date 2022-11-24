class Order < ApplicationRecord
  has_one :shipment
  belongs_to :customer

  validates :id, numericality: true
end
