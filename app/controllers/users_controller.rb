class UsersController < ApplicationController

  before_action :set_composition, only: [:show, :edit, :update, :destroy]

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
      redirect_to @composition, info: t('compositions.controller.post_update')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :edit
    end
  end

  def destroy

  end

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id, :user_id)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end

end