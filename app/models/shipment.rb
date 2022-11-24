class Shipment < ApplicationRecord
  belongs_to :order

  validates :id, numericality: true
end
