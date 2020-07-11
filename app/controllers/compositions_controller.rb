class CompositionsController < ApplicationController
  before_action :set_composition_category, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
  end

  def show
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(post_params)
    if @composition.save
      redirect_to @composition , success: t('compositions.controller.post_created')
    else
      render :new , danger: t('compositions.controller.post_not_created')
    end
  end

  def edit
  end

  def update
    if @composition.update(post_params)
      redirect_to @composition, info: t('compositions.controller.post_update')
    else
      render :edit, danger: t('compositions.controller.post_not_created')
    end
  end

  def destroy
    @composition.destroy
    redirect_to compositions_path, success: t('compositions.controller.post_delete')
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags)

  end

  def set_composition_category
    @composition = Composition.find(params[:id])
  end
end