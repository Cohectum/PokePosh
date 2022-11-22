class OrderProduct < ApplicationRecord
  belongs_to :custom_product
  belongs_to :order
end
