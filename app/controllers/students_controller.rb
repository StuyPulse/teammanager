class StudentsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:check]
  def index
    @students = Student.order :last_name
    respond_to do |format|
      format.html
      format.csv { render text: @students.to_csv }
    end
  end

  def show
    @student = Student.find params[:id]
    
    @seasonals = [] #Contains a hash for every seasonal
    seasonals_to_display = [SafetyTest, TeamDue] 
    @current_year = Date.today.month < 9 ? Date.today.year : Date.today.year + 1
    
    seasonals_to_display.each do |seasonal_model|
      hash_for_seasonal = {}
      hash_for_seasonal[:seasonal_type]  = seasonal_model.to_s.tableize.singularize
      hash_for_seasonal[:seasonals] = {}

      first_seasonal = seasonal_model.where(student_id: @student.id).order("YEAR ASC").first
      first_seasonal_year = first_seasonal ? first_seasonal.year : @current_year
    
      @current_year.downto(first_seasonal_year) do |year|
        seasonal = seasonal_model.where(student_id: @student.id, year: year).first
        hash_for_seasonal[:seasonals][year] = seasonal #nil if there's none
      end
      @seasonals << hash_for_seasonal
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new params[:student]
    if @student.save
      flash[:notice] = 'Student created successfully.'
      redirect_to controller: 'students', action: 'show', id: @student.id
    else
      flash.now[:alert] = @student.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def edit
    @student = Student.find params[:id]
  end

  def update
    @student = Student.find params[:id]
    if @student.update_attributes params[:student]
      flash[:notice] = 'Student updated successfully.'
      redirect_to action: 'show'
    else
      flash.now[:alert] = @student.errors.full_messages.join('<br>').html_safe
      render action: 'edit'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:notice] = 'Student deleted successfully.'
    redirect_to controller: 'students', action: 'index'
  end
  
  def check
    @display_student = ""
    if params[:student]
      name = params[:student]["name"]
      id = params[:student]["id"]
      candidates = Student.where("student_id = ?", id)
      if candidates.any?
        if candidates.first.full_name == name
          @display_student = candidates.first
          current_year = Date.today.month < 9 ? Date.today.year : Date.today.year + 1
          @valid_safety_test = @display_student.safety_tests.where("year = ?", current_year).any?
          @valid_team_due = @display_student.team_dues.where("year = ?", current_year).any?
          @valid_medical = @display_student.medical_forms.select { |form| form.is_valid?}.any?
        else
          flash.now[:alert] = "The information entered does not match any student on record."
        end
      else
        flash.now[:alert] = "The information entered does not match any student on record."
      end
    end
  end
end
