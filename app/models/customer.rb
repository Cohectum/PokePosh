class Customer < ApplicationRecord
  has_many :orders

  validates :id, numericality: true
end
