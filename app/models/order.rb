class Order < ApplicationRecord
  has_one :shipment
  belongs_to :customer

end
