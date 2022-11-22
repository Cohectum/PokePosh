class Cart < ApplicationRecord
  has_many :order_products
  has_many :custom_product, through: :order_products

  def total
    order_products.to_a.sum {|order_product| order_product.total}
  end
end
