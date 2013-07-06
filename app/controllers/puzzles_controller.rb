class PuzzlesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "curiosity123!", except: [:index, :show]

	def new
		@puzzle = Puzzle.new
	end

	def create
		@puzzle = Puzzle.new(post_params)
		if @puzzle.save
			redirect_to @puzzle
		else 
			render 'new'
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

  	def index
  		
  		@puzzles = Puzzle.paginate(:per_page => 5, :page => params[:page])

  		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @puzzles }
    	end
	end

	def edit
		@puzzle = Puzzle.find(params[:id])
	end	

	def destroy
  		@puzzle = Puzzle.find(params[:id])
  		@puzzle.destroy
  		redirect_to puzzles_pathd
	end

	def update
		@puzzle = Puzzle.find(params[:id])

		if @puzzle.update_attributes(params[:puzzle].permit(:title, :question, :solution, :difficulty, :image_url))
			#logger.debug "Update: Success"
			redirect_to @puzzle
		else 
			#logger.debug "Update: Failure"
			render 'edit'
		end		
	end	 

  private
  def post_params
    params.require(:puzzle).permit(:title, :question, :solution, :difficulty, :image_url)
  end

end
