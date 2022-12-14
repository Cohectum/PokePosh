class OrderProduct < ApplicationRecord
  belongs_to :custom_product
  belongs_to :cart

  def total
    custom_product.price * quantity
  end

  def in_cents
    (custom_product.price * 100).to_i
  end
end
