class SafetyTestsController < ApplicationController
  before_action :set_safety_test, only: [:destroy]

  # POST /safety_tests
  # POST /safety_tests.json
  def create
    @safety_test = SafetyTest.new(safety_test_params)

    respond_to do |format|
      if @safety_test.save
        @student = @safety_test.student
        format.js
        format.html { redirect_to @safety_test, notice: 'Safety test was successfully created.' }
        format.json { render :show, status: :created, location: @safety_test }
      else
        format.js
        format.html { render :new }
        format.json { render json: @safety_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safety_tests/1
  # DELETE /safety_tests/1.json
  def destroy
    @student = @safety_test.student
    @safety_test.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to safety_tests_url, notice: 'Safety test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safety_test
      @safety_test = SafetyTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safety_test_params
      params.require(:safety_test).permit(:student_id, :year)
    end
end
