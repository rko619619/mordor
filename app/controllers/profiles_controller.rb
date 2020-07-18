class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to @profile, success: t('compositions.controller.post_created')
      else
        flash.now[:danger] = t('compositions.controller.post_not_created')
        render :new
      end
  end

  def update
      if @profile.update(profile_params)
        redirect_to @profile, info: t('compositions.controller.post_update')
      else
        flash.now[:danger] = t('compositions.controller.post_not_created')
        render :edit
      end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path, success: t('compositions.controller.post_delete')
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:screenname, :city, :birthday)
    end
end
