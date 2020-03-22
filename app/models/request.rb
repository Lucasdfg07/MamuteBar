class Request < ApplicationRecord

  validates :table, :quantity, :owner, :products, :status, :payment, presence: false


  def add_product_and_quantity
    quantity = self.quantity.push("")
    products = self.products.push("")

    self.update(products: products, quantity: quantity)
  end

  def remove_product_and_quantity
    self.products.pop
    self.quantity.pop

    self.update(products: products, quantity: quantity)
  end

  def sum_request_total_price
    total = 0
    count = 0
    self.products.each do |product|
      product_price = Product.find(product.to_i).price

      total += product_price * self.quantity[count]

      count += 1
    end

    total
  end

  def item_price_on_bill(product, quantity)
    total = 0

    product_price = Product.find(product.to_i).price

    total = product_price * quantity
  end

  def sum_total_price_on_bill(table)
    total = 0

    requests = Request.where(table: table, status: :opened)

    total = 0
    self.products.zip(self.quantity).each do |product, quantity|
      product_price = Product.find(product.to_i).price

      total += product_price * quantity
    end

    total
  end

  def close_table_bill(table_id, payment)
    table = Request.where(table: table_id, status: :opened)
    table.update(status: :closed, payment: payment)
  end

  def update_product_quantity
    if !self.products.last.blank?
      count = 0
      self.products.each do |p|
        product = Product.find(p.to_i)
        result = product.quantity - self.quantity[count]

        product.update(quantity: result)
        count += 1
      end
    end
  end
end
