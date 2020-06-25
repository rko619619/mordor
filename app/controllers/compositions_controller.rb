class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def show
    @composition = Composition.find(params[:id])
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(post_params)
    if @composition.save
      redirect_to @composition
    else
      render :new
    end

  end

  def edit
  private

  def post_params
    params.require(:composition).permit(:title, :photo, :description)
  end
end