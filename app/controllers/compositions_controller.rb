class CompositionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all
    @compositions = Composition.paginate(page: params[:page],per_page: 8)
  end

  def show
    @comment = Comment.new
    @comments = @composition.comments.order(created_at: :desc )
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(post_params)
    if @composition.save
      redirect_to @composition , success: t('compositions.controller.post_created')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :new
    end
  end

  def edit
  end

  def update
    if @composition.update(post_params)
      redirect_to @composition, info: t('compositions.controller.post_update')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to compositions_path, success: t('compositions.controller.post_delete')
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end
end