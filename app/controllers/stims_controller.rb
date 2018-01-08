class StimsController < ApplicationController
  before_action :set_stim, only: [:show, :edit, :update, :destroy]

  # GET /stims
  # GET /stims.json
  def index
    @stims = Stim.all
  end

  # GET /stims/1
  # GET /stims/1.json
  def show
  end

  # GET /stims/new
  def new
    @stim = Stim.new
  end

  # GET /stims/1/edit
  def edit
  end

  # POST /stims
  # POST /stims.json
  def create
    @stim = Stim.new(stim_params)

    respond_to do |format|
      if @stim.save
        format.html { redirect_to @stim, notice: 'Stim was successfully created.' }
        format.json { render :show, status: :created, location: @stim }
      else
        format.html { render :new }
        format.json { render json: @stim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stims/1
  # PATCH/PUT /stims/1.json
  def update
    respond_to do |format|
      if @stim.update(stim_params)
        format.html { redirect_to @stim, notice: 'Stim was successfully updated.' }
        format.json { render :show, status: :ok, location: @stim }
      else
        format.html { render :edit }
        format.json { render json: @stim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stims/1
  # DELETE /stims/1.json
  def destroy
    @stim.destroy
    respond_to do |format|
      format.html { redirect_to stims_url, notice: 'Stim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stim
      @stim = Stim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stim_params
      params.require(:stim).permit(:year, :student_id)
    end
end
