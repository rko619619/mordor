class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :check_admin
  before_action :check_ban

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: t('admin.categories.controller.categories_created')
    else
      @categories = Category.all.order(:name)
      flash[:danger] = t('admin.categories.controller.categories_not_created')
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, success: t('admin.categories.controller.categories_update')
    else
      flash[:danger] = t('admin.categories.controller.categories_not_update')
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: t('admin.categories.controller.categories_delete')
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  protected

  def check_admin
    redirect_to root_path, alert: t('admin.permission') unless current_user.admin?
  end

  def check_ban
    if current_user.ban?
      redirect_to root_path, alert: t('admin.ban')
    end
  end

end