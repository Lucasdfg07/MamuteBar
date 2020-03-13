class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(id: :ASC)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Produto alterado com sucesso!'
    else
      redirect_to products_path, notice: 'Erro na alteração do produto, tente mais tarde.'
    end
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to products_path, notice: 'Produto Cadastrado com sucesso!'
    else
      redirect_to products_path, notice: 'Erro no cadastro do produto, tente novamente mais tarde.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:category_id, :name, :quantity, :price)
  end
end
