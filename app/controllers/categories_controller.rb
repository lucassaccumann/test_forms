class CategoriesController < ApplicationController

before_action :set_category, only: [:show, :edit, :update, :destroy, :index]

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.find_by_slug(params[:id])
  end

  def new
    @category = Category.new
    render :new
  end

  def edit
    render :edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Categoria criada com sucesso!'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Categoria foi atualizada com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to sub_categories_url, notice: 'Campo excluido com sucesso.'
  end

  private

    def set_category
      @category = Category.find_by_slug(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :slug)
    end	

end
