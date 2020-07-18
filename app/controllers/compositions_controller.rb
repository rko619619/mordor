class CompositionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_composition_category, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.order(created_at: :desc)
    @compositions = Composition.paginate(page: params[:page],per_page: 8)
  end

  def show
    @comment = Comment.new
    @comments = @composition.comments.order("created_at DESC")
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(post_params)
    @composition.user_id = current_user.id
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

  end

  def destroy
    if current_user.id == @composition.user_id
      @composition.destroy
      redirect_to compositions_path, success: t('compositions.controller.post_delete')
    end
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id, :user_id)
  end

  def set_composition_category
    @composition = Composition.find(params[:id])
  end
end