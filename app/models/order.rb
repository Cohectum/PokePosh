class Order < ApplicationRecord
  has_one :shipment
  has_one :cart
  has_one :address

end
