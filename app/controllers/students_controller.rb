class StudentsController < ApplicationController
  def index
    @students = Student.order :last_name
    respond_to do |format|
      format.html
      format.csv { render text: @students.to_csv }
    end
  end

  def show
    @student = Student.find params[:id]
   
    @current_year = Date.today.month < 9 ? Date.today.year : Date.today.year + 1
    @valid_safety_test = false
    valid_safety_tests = @student.safety_tests.find_all{|test| test.year == @current_year} 
    if valid_safety_tests.any?
      @valid_safety_test = valid_safety_tests.first
    end
    @older_safety_tests = @student.safety_tests.find_all{|test| test.year != @current_year}
 
    @current_season_team_due = false
    if (@student.team_dues.find_all{|test| test.year == @current_year}).any?
      @current_season_team_due = true
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
end
