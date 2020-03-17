class CategoriesController < ApplicationController
  def index
    @count = 0
    @categories = Category.order(name: :ASC).paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Venda Cadastrada com sucesso!'
    else
      redirect_to categories_path, notice: 'Erro no cadastro da venda, tente novamente mais tarde.'
    end
  end

  def destroy
    @category.destroy
    redirect_to requests_path, notice: 'Categoria Apagada com sucesso!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

  def category_params
    params.require(:category).permit(:name)
  end
end
