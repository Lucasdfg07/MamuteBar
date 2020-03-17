class PucharsesController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @q = Pucharse.ransack(params[:q])
    @pucharses = @q.result.order(id: :ASC).paginate(page: params[:page], per_page: 10)
  end

  def new
    @pucharse = Pucharse.new
  end

  def edit
  end

  def update
    if @pucharse.update(product_params)
      redirect_to products_path, notice: 'Compra alterado com sucesso!'
    else
      redirect_to products_path, notice: 'Erro na alteração da compra, tente mais tarde.'
    end
  end

  def create
    @pucharse = Pucharse.create(product_params)

    if @pucharse.save
      redirect_to pucharses_path, notice: 'Compra Cadastrado com sucesso!'
    else
      redirect_to pucharses_path, notice: 'Erro no compra do produto, tente novamente mais tarde.'
    end
  end

  private

  def set_product
    @pucharse = Pucharse.find(params[:id])
  end

  def product_params
    params.require(:pucharse).permit(:category_id, :name, :quantity, :price)
  end
end
