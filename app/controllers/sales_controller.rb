class SalesController < ApplicationController

  def index
    @requests = Request.where(status: :opened).order(table: :ASC)

    @products = Product.all
  end

  def edit
    table_id = params[:id]
    request = Request.where(table: table_id, status: :opened)

    request.each do |r|
      r.close_table_bill(table_id)
    end

    redirect_to sales_path, notice: 'Mesa fechada com sucesso!'
  end

end
