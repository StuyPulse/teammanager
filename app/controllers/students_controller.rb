class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    authorize Student
    @students = Student.all
  end

  def dashboard
    authorize Student
    @students = Student.active
  end

  # GET /students/1
  # GET /students/1.json
  def show
    authorize @student
    @recent_medical = @student.medicals.order("date").last.date.to_s
  end

  # GET /students/new
  def new
    authorize Student
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    authorize @student
  end

  # POST /students
  # POST /students.json
  def create
    authorize Student
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    authorize @student
    respond_to do |format|
      if @student.update(permitted_attributes(@student))
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    authorize @student
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :preferred_name, :grad_year, :osis, :email, :phone, :team_id)
    end
end
