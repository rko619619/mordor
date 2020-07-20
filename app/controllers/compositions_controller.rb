class CompositionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.order(created_at: :desc)
    @compositions = Composition.paginate(page: params[:page],per_page: 8)
  end

  def show
    @comment = Comment.new
    @comments = @composition.comments.order("created_at DESC")
  end

  private

  def post_params
    params.require(:composition).permit(:title, :description, :image, :content, :all_tags, :category_id, :user_id)
  end

  def set_composition
    @composition = Composition.find(params[:id])
  end
end