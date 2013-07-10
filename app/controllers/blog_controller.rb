class BlogController < ApplicationController
  def index

  	@puzzles = Puzzle.paginate(:per_page => 5, :page => params[:page])
	respond_to do |format|
      	format.html # index.html.erb
      	format.json { render json: @puzzles }
    	end
  end

  	def show
 		begin
      		@puzzle = Puzzle.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
      		logger.error "Attempt to access invalid cart #{params[:id]}"
      		redirect_to root_path, notice: 'Invalid ID'
    	else
      		respond_to do |format|
        		format.html # show.html.erb
        		format.json { render json: @puzzle }
      	end
    	end
  	end


  
end
