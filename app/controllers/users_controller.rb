class UsersController < ApplicationController

  before_action :set_composition, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_ban
  def index
    @compositions = Composition.where(user_id: current_user.id)
    @compositions.paginate(page: params[:page],per_page: 4)
  end

  def show
    @compositions = Composition.where(user_id: current_user.id)
    @composition.paginate(page: params[:page],per_page: 4)
  end

  def new

  end

  def create

  end

  def edit
  end

  def update
    if @composition.update(post_params)
      redirect_to @composition, info: t('admin.user.controller.user_update')
    else
      flash.now[:danger] = t('admin.user.controller.user_not_update')
      render :edit
    end
  end

  def destroy
    @composition.destroy
    flash.now[:danger] = t('compositions.controller.post_delete')
  end

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