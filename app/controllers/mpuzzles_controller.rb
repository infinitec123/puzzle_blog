class MpuzzlesController < ApplicationController
  
  http_basic_authenticate_with name: "admin", password: "curiosity123!", except: [:index, :show]

  # GET /mpuzzles
  # GET /mpuzzles.json
  def index
    @mpuzzles = Mpuzzle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mpuzzles }
    end
  end

  # GET /mpuzzles/1
  # GET /mpuzzles/1.json
  def show
    @mpuzzle = Mpuzzle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mpuzzle }
    end
  end

  # GET /mpuzzles/new
  # GET /mpuzzles/new.json
  def new
    @mpuzzle = Mpuzzle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mpuzzle }
    end
  end

  # GET /mpuzzles/1/edit
  def edit
    @mpuzzle = Mpuzzle.find(params[:id])
  end

  # POST /mpuzzles
  # POST /mpuzzles.json
  def create
    @mpuzzle = Mpuzzle.new(mpuzzle_params)

    respond_to do |format|
      if @mpuzzle.save
        format.html { redirect_to @mpuzzle, notice: 'Mpuzzle was successfully created.' }
        format.json { render json: @mpuzzle, status: :created, location: @mpuzzle }
      else
        format.html { render action: "new" }
        format.json { render json: @mpuzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mpuzzles/1
  # PATCH/PUT /mpuzzles/1.json
  def update
    @mpuzzle = Mpuzzle.find(params[:id])

    respond_to do |format|
      if @mpuzzle.update_attributes(mpuzzle_params)
        format.html { redirect_to @mpuzzle, notice: 'Mpuzzle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mpuzzle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mpuzzles/1
  # DELETE /mpuzzles/1.json
  def destroy
    @mpuzzle = Mpuzzle.find(params[:id])
    @mpuzzle.destroy

    respond_to do |format|
      format.html { redirect_to mpuzzles_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def mpuzzle_params
      params.require(:mpuzzle).permit(:difficulty, :hint, :image_url, :question, :solution, :title)
    end
end
