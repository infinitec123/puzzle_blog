class BlogController < ApplicationController
  def index

  	@puzzles = Puzzle.paginate(:per_page => 5, :page => params[:page])
	respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @puzzles }
    	end
  end
end
