class FieldsController < ApplicationController

  before_action :set_field, only: [:show, :edit, :update, :destroy]

  def index
    @fields = Field.all
  end

  def show
    @fields = Field.find(params[:id])
  end

  def new
    @field = Field.new
    @sub_category = SubCategory.find(params[:sub_category])
    render :new 
  end

  def edit
    render :edit
  end

  def create
    @field = Field.new(field_params)
    if @field.save
      redirect_to @field, notice: 'Campo criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @field.update(field_params)
      redirect_to @field, notice: 'Campo foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @field.destroy
    redirect_to :back, notice: 'Campo excluído com sucesso.'
  end

  private

    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:order, :title, :tipo, :values, :sub_category_id)
    end


end
