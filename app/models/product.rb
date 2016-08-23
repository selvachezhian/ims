class Product < ApplicationRecord
  has_one :inventory

  validates :name, presence: true
  validates :uid, presence: true, uniqueness: true
end
