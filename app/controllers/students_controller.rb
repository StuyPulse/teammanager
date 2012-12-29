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
    
    @first_safety_test_year = @student.safety_tests.any? ? @student.safety_tests.order("YEAR ASC").first.year : @current_year
 
    @valid_team_dues = false
    valid_team_dues = @student.team_dues.find_all{|test| test.year == @current_year}
    if valid_team_dues.any?
      @valid_team_due= valid_team_dues.first
    end
    
    @first_team_due_year = @student.team_dues.any? ? @student.team_dues.order("YEAR ASC").first.year : @current_year
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
