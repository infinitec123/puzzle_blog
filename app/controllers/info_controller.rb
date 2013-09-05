class InfoController < ApplicationController
  def index

  	  	@puzzles = Puzzle.find(:all, :order => 'title')
  		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @puzzles }
    	end
  end
end
