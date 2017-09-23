class SafetyTestsController < ApplicationController
  before_action :set_safety_test, only: [:show, :edit, :update, :destroy]

  # GET /safety_tests
  # GET /safety_tests.json
  def index
    @safety_tests = SafetyTest.all
  end

  # GET /safety_tests/1
  # GET /safety_tests/1.json
  def show
  end

  # GET /safety_tests/new
  def new
    @safety_test = SafetyTest.new
  end

  # GET /safety_tests/1/edit
  def edit
  end

  # POST /safety_tests
  # POST /safety_tests.json
  def create
    @safety_test = SafetyTest.new(safety_test_params)

    respond_to do |format|
      if @safety_test.save
        format.html { redirect_to @safety_test, notice: 'Safety test was successfully created.' }
        format.json { render :show, status: :created, location: @safety_test }
      else
        format.html { render :new }
        format.json { render json: @safety_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safety_tests/1
  # PATCH/PUT /safety_tests/1.json
  def update
    respond_to do |format|
      if @safety_test.update(safety_test_params)
        format.html { redirect_to @safety_test, notice: 'Safety test was successfully updated.' }
        format.json { render :show, status: :ok, location: @safety_test }
      else
        format.html { render :edit }
        format.json { render json: @safety_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safety_tests/1
  # DELETE /safety_tests/1.json
  def destroy
    @safety_test.destroy
    respond_to do |format|
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
      params.require(:safety_test).permit(:is_passed, :is_signed, :student_id, :year)
    end
end
