class CompositionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]
  before_action :check_ban, except: [:index, :show]
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
    if @composition.update(post_params)
      redirect_to @composition, success: t('compositions.controller.post_update')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :edit
    end
  end

  def destroy
    if current_user.id == @composition.user_id or current_user.admin?
      @composition.destroy
      redirect_to compositions_path, success: t('compositions.controller.post_delete')
    end
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id, :user_id)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end

  protected

  def check_ban
    if current_user.ban?
      redirect_to root_path, alert: t('admin.ban')
    end
  end

end