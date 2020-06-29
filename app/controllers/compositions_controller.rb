class CompositionsController < ApplicationController
  before_action :set_composition_category, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
    @category = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @composition = Composition.new
  end

  def create
    @category = Category.new(post_params)
    @composition = Composition.new(post_params)
    if @composition.save and @category.save
      redirect_to @composition
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @composition.update_attributes(post_params) and @category.update_attributes(post_params)
      redirect_to @composition
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    @composition.destroy
    redirect_to compositions_path
  end

  private

  def post_params
    params.require(:composition).permit(:title, :photo, :description)
    params.require(:category).permit(:name)
  end

  def set_composition_category
    @composition = Composition.find(params[:id])
    @category = Category.find(params[:id])
  end
end