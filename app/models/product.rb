class Product < ApplicationRecord
  has_many :custom_products
  has_one :category
end
