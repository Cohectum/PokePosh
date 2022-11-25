class Product < ApplicationRecord
  has_many :custom_products
  belongs_to :category

  paginates_per 10
end
