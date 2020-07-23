class CommentsController < ApplicationController
  before_action :set_composition
  before_action :authenticate_user!
  before_action :check_ban
  def create
    @comment = @composition.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :composition_id)
  end

  def set_composition
    @composition = Composition.find(params[:composition_id])
  end

  protected

  def check_ban
    if current_user.ban?
      redirect_to root_path, alert: t('admin.ban')
    end
  end

end
