class Pucharse < ApplicationRecord
  belongs_to :category		

  validates :name, uniqueness: true, presence: true
  validates_presence_of :price
end
