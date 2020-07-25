class SearchesController < ApplicationController

  def show
    @compositions = Composition.search(params[:query])
  end

  def index
    @compositions = Composition.search(params[:query])
  end

end
