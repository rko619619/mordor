class CommentsController < ApplicationController
  before_action :set_composition
  before_action :authenticate_user!
  def index
    @comments = Comment.all
  end

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
end
