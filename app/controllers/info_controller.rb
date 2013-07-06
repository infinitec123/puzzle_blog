class InfoController < ApplicationController
  def index

  	  	@puzzles = Puzzle.all
  		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @puzzles }
    	end
  end
end
