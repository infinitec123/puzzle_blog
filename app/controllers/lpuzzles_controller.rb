class LpuzzlesController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "curiosity123!", except: [:index, :show]
  
  # GET /lpuzzles
  # GET /lpuzzles.json
  def index
    @lpuzzles = Lpuzzle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lpuzzles }
    end
  end

  # GET /lpuzzles/1
  # GET /lpuzzles/1.json
  def show
    @lpuzzle = Lpuzzle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lpuzzle }
    end
  end

  # GET /lpuzzles/new
  # GET /lpuzzles/new.json
  def new
    @lpuzzle = Lpuzzle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lpuzzle }
    end
  end

  # GET /lpuzzles/1/edit
  def edit
    @lpuzzle = Lpuzzle.find(params[:id])
  end

  # POST /lpuzzles
  # POST /lpuzzles.json
  def create
    @lpuzzle = Lpuzzle.new(lpuzzle_params)

    respond_to do |format|
      if @lpuzzle.save
        format.html { redirect_to @lpuzzle, notice: 'Lpuzzle was successfully created.' }
        format.json { render json: @lpuzzle, status: :created, location: @lpuzzle }
      else
        format.html { render action: "new" }
        format.json { render json: @lpuzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lpuzzles/1
  # PATCH/PUT /lpuzzles/1.json
  def update
    @lpuzzle = Lpuzzle.find(params[:id])

    respond_to do |format|
      if @lpuzzle.update_attributes(lpuzzle_params)
        format.html { redirect_to @lpuzzle, notice: 'Lpuzzle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lpuzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lpuzzles/1
  # DELETE /lpuzzles/1.json
  def destroy
    @lpuzzle = Lpuzzle.find(params[:id])
    @lpuzzle.destroy

    respond_to do |format|
      format.html { redirect_to lpuzzles_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def lpuzzle_params
      params.require(:lpuzzle).permit(:difficulty, :hint, :image_url, :question, :solution, :title)
    end
end
