class SubCategoriesController < ApplicationController

  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @sub_categories = SubCategory.all
  end

  def new
	@sub_category = SubCategory.new
	@category = Category.find(params[:category])
	render :new
  end

  def show
  	@sub_categories = SubCategory.find_by_slug(params[:id])
    @field = Field.all
  end

  def gform
    @sub_categories = SubCategory.find_by_slug(params[:id])
    @field = Field.all
    render :gform 
  end
    

  def edit
    render :edit
  end

  def update
	  if @sub_category.update(sub_category_params)
		  flash[:notice] = "Sub-categoria atualizada com sucesso"
		  redirect_to @sub_category, notice: "Sub-categoria atualizada com sucesso"
	  else
		  render :edit
	  end
  end	

  def create
	  @sub_category = SubCategory.new sub_category_params
	  if @sub_category.save
		   flash[:notice] = "Produto salvo com sucesso"
		  redirect_to @sub_category, notice: 'Sub-categoria criada com sucesso!'
	  else
		  render :new
	  end
  end	

  def destroy
	  @sub_category.destroy
	  redirect_to sub_categories_url, notice: 'Categoria excluida com sucesso!'
  end

  private

  def set_sub_category
	  @sub_category = SubCategory.find_by_slug(params[:id])
  end

  def sub_category_params
	params.require(:sub_category).permit(:name,:slug,:category_id)
  end	

end
