class Admin::UsersController < ApplicationController
  before_action :set_users, only: [:edit, :update, :destroy]


  def index
    @users = User.all
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



  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin,)
  end

end