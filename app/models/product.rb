class Product < ApplicationRecord
  belongs_to :category

  validates :name, uniqueness: true, presence: true
  validates_presence_of :quantity, :price

  def verify_quantity
    if self.quantity < 50
      message = self.name+" está acabando no estoque!! Somente "+self.quantity.to_s+" unidades!"
    end
  end

end
