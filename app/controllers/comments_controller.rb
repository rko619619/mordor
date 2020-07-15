class CommentsController < ApplicationController
  before_action :set_composition
  before_action :authenticate_user!

  def create
    @comment = @composition.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    SendCommentJob.perform_later(@comment)


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
end
