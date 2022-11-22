class OrderProduct < ApplicationRecord
  belongs_to :custom_product
  belongs_to :cart

  def total
    custom_product.price * quantity
  end
end
