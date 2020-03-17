class Pucharse < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates_presence_of :price
end
