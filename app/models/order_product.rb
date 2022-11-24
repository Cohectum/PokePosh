class OrderProduct < ApplicationRecord
  belongs_to :custom_product
  belongs_to :cart

  validates :id, numericality: true

  def total
    custom_product.price * quantity
  end
end
