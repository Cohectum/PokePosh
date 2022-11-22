class Product < ApplicationRecord
  has_many :custom_products
  belongs_to :category
end
