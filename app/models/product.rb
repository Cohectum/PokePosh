class Product < ApplicationRecord
  has_many :custom_products
  belongs_to :category

  validates :id, numericality: true

  paginates_per 10
end
