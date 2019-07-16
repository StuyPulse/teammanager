class TripDismissalsController < ApplicationController
  before_action :set_trip_dismissal, only: [:show, :edit, :update, :destroy]

  # GET /trip_dismissals
  # GET /trip_dismissals.json
  def index
    @trip_dismissals = TripDismissal.all
  end

  # GET /trip_dismissals/1
  # GET /trip_dismissals/1.json
  def show
  end

  # GET /trip_dismissals/new
  def new
    @trip_dismissal = TripDismissal.new
  end

  # GET /trip_dismissals/1/edit
  def edit
  end

  # POST /trip_dismissals
  # POST /trip_dismissals.json
  def create
    @trip_dismissal = TripDismissal.new(trip_dismissal_params)

    respond_to do |format|
      if @trip_dismissal.save
        format.html { redirect_to @trip_dismissal, notice: 'Trip dismissal was successfully created.' }
        format.json { render :show, status: :created, location: @trip_dismissal }
      else
        format.html { render :new }
        format.json { render json: @trip_dismissal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_dismissals/1
  # PATCH/PUT /trip_dismissals/1.json
  def update
    respond_to do |format|
      if @trip_dismissal.update(trip_dismissal_params)
        format.html { redirect_to @trip_dismissal, notice: 'Trip dismissal was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_dismissal }
      else
        format.html { render :edit }
        format.json { render json: @trip_dismissal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_dismissals/1
  # DELETE /trip_dismissals/1.json
  def destroy
    @trip_dismissal.destroy
    respond_to do |format|
      format.html { redirect_to trip_dismissals_url, notice: 'Trip dismissal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_dismissal
      @trip_dismissal = TripDismissal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_dismissal_params
      params.require(:trip_dismissal).permit(:trip_id, :student_id)
    end
end
