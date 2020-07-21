class Admin::CompositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_composition_edit, only: [:edit]
  def index
    @compositions = Composition.where(:user_id =>params[:user_id] )
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
    if @composition.save
      redirect_to [:admin,@composition] , success: t('compositions.controller.post_created')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :new
    end
  end

  def edit
    flash.now[:danger] = t('compositions.controller.post_not_created')
  end

  def update
    if @composition.update(post_params)
      redirect_to [:admin, @composition], success: t('compositions.controller.post_update')
    else
      flash.now[:danger] = t('compositions.controller.post_not_created')
      render :edit
    end
  end

  def destroy
    @composition.destroy
    redirect_to admin_users_path, success: t('compositions.controller.post_delete')
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id, :user_id, :user, :id)
  end

  def set_composition
    @composition = Composition.find(params[:user])
  end

  def set_composition_edit
    @composition = Composition.find(params[:id])
  end

end