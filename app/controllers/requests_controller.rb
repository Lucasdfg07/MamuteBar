class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]


  def index
    @requests = Request.where(status: :opened).order(table: :ASC)
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to requests_path, notice: 'Pedido criado com sucesso!'
    else
      redirect_to requests_path, notice: 'Erro na criação do pedido, tente mais tarde.'
    end
  end

  def update
    if @request.update(request_params)
      redirect_to requests_path, notice: 'Pedido alterado com sucesso!'
    else
      redirect_to requests_path, notice: 'Erro na alteração do pedido, tente mais tarde.'
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
      params.require(:request).permit(:product_id, :table, :quantity)
    end
end
