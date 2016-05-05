class CandidatesController < ApplicationController

  def index
    @grid = CandidatesGrid.new(params[:candidates_grid]) do |scope|
      scope.page(params[:page])
    end
  end

end

