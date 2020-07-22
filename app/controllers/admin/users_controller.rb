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
      redirect_to admin_users_path, success: 'Категория успешно обновлена'
    else
      flash[:danger] = 'Категория не обновлена'
      render :edit
    end
  end


  def destroy

  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end

  protected

  def check_admin
    redirect_to root_path, alert: "У вас нет прав доступа к данной странице" unless current_user.admin?
  end

end