class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :new]


  def index
    @q = Request.ransack(params[:q])
    @requests = @q.result.where(status: :opened).order(table: :ASC).paginate(page: params[:page], per_page: 10)
  end

  def new
    @request = Request.create(products: [""], quantity: [""])

    redirect_to edit_request_path(id: Request.last.id)
  end

  def edit
    @count = 0
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to requests_path, notice: 'Pedido criado com sucesso!'
    else
      redirect_to requests_path, notice: 'Erro na criação do pedido, tente mais tarde.'
    end
  end

  def increment_products_and_quantity
    if @request.add_product_and_quantity
      redirect_to request.referrer
    end
  end

  def decrement_products_and_quantity
    if @request.remove_product_and_quantity
      redirect_to request.referrer
    end
  end

  def update
    if @request.update(request_params)
      redirect_to request.referrer
    end
  end


  def destroy
    @request.destroy
    redirect_to requests_path, notice: 'Pedido cancelado com sucesso!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:owner, :table, products: [], quantity: [])
    end
end
