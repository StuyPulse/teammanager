class MedicalsController < ApplicationController
  before_action :set_medical, only: [:destroy]

  # POST /medicals
  # POST /medicals.json
  def create
    @medical = Medical.new(medical_params)

    respond_to do |format|
      if @medical.save
        @student = @medical.student
        format.js
        format.html { redirect_to @medical, notice: 'Medical was successfully created.' }
        format.json { render :show, status: :created, location: @medical }
      else
        format.js
        format.html { render :new }
        format.json { render json: @medical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicals/1
  # DELETE /medicals/1.json
  def destroy
    @student = @medical.student
    @medical.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to medicals_url, notice: 'Medical was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical
      @medical = Medical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_params
      params.require(:medical).permit(:student_id, :year)
    end
end
