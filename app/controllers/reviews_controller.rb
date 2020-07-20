class ReviewsController < ApplicationController
  before_action :find_composition



  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    @review.composition_id = @composition.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to @composition
    else
      flash.now[:danger] = t('profile.controller.profile_not_created')
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_composition
    @composition = Composition.find(params[:composition_id])
  end

end
