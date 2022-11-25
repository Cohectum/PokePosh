class Character < ApplicationRecord
  has_many :custom_products

  validates :name, uniqueness: true
end
