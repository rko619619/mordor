class SearchesController < ApplicationController

  def index
    @compositions = Composition.search(params[:query])
  end
end
