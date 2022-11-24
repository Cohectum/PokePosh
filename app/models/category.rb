class Category < ApplicationRecord
  has_many :products

  validates :name, uniqueness: true
  validates :id, numericality: true
end
