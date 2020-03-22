class SalesController < ApplicationController

  def index
    @requests = Request.where(status: :opened).order(table: :ASC)

    @products = Product.all
    @count = 0
  end

  def edit
  end

  def update
    table_id = params[:id]
    payment = params[:request][:payment]

    request = Request.where(table: table_id, status: :opened)

    request.each do |r|
      r.close_table_bill(table_id, payment)
      r.update_product_quantity
    end

    redirect_to sales_path, notice: 'Mesa fechada com sucesso!'
  end

  def graph
    @products = Product.all
  end

end
