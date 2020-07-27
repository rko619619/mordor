class Admin::UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :check_admin
  before_action :check_ban

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

  def show
    @users = User.all
    @profiles = Profile.all
    @compositions = Composition.all
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: t("admin.user.controller.user_update")
    else
      flash[:danger] = t('admin.categories.controller.user_not_update')
      render :edit
    end
  end


  def destroy
    if User.find(params[:id]).destroy
      flash[:success] = t("admin.user.controller.user_delete")
      redirect_to admin_user_path
    else
      flash[:danger] = t('admin.categories.controller.user_not_delete')
      redirect_to admin_users_path
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

  def check_ban
    if current_user.ban?
      redirect_to root_path, alert: t('admin.ban')
    end
  end

end