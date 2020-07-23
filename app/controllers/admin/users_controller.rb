class Admin::UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_admin
  def index
    @users = User.all
    @profiles = Profile.all
    @compositions = Composition.all
  end

  def new
    @user = User.new
    @users = User.all.order(:email)
  end

  def create
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path, success: t("admin.user.controller.user_update")
    else
      flash[:danger] = t('admin.categories.controller.user_not_update')
      render :edit
    end
  end


  def destroy
    if @user.destroy
      redirect_to @users
    else
      flash[:danger] = t('admin.categories.controller.user_delete')
      render :edit
    end

  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin, :ban)
  end

  protected

  def check_admin
    redirect_to root_path, alert: t('admin.permission') unless current_user.admin?
  end

end