class SeasonalsController < ApplicationController
  before_action :set_seasonal, only: [:show, :edit, :update, :destroy]

  # POST /seasonals
  # POST /seasonals.json
  def create
    @seasonal = Seasonal.new(seasonal_params)

    respond_to do |format|
      if @seasonal.save
        @student = @seasonal.student
        format.js
        format.html { redirect_to @seasonal, notice: 'Seasonal was successfully created.' }
        format.json { render :show, status: :created, location: @seasonal }
      else
        format.js
        format.html { render :new }
        format.json { render json: @seasonal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasonals/1
  # DELETE /seasonals/1.json
  def destroy
    @student = @seasonal.student
    @seasonal.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to seasonals_url, notice: 'Seasonal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasonal
      @seasonal = Seasonal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seasonal_params
      params.require(:seasonal).permit(:student_id, :year, :seasonal_type)
    end
end
