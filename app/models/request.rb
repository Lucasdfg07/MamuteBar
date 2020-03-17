class Request < ApplicationRecord
  belongs_to :product

  before_create :update_product_quantity

  validates_presence_of :table, :quantity, :owner
  validates :table_unique, :status, :payment, presence: false


  def sum_bill_total(table_id)
    requests = Request.where(table: table_id, status: :opened)

    total = 0
    requests.each do |request|
      total += request.product.price * request.quantity
    end

    total
  end

  def close_table_bill(table_id, payment)
    table = Request.where(table: table_id, status: :opened)
    table.update(status: :closed, payment: payment)
  end

  def get_total_price_sold
    products = Product.all

    products.each do |product|
      
    end
  end

  private

  def update_product_quantity
      product = Product.find(self.product_id)
      result = product.quantity - self.quantity

      product.update(quantity: result)
  end
end
