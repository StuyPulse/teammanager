class SafetyTestsController < ApplicationController
  def new
    @safety_test = SafetyTest.new
  end

  def create
    @safety_test = Student.find(params[:student_id]).safety_tests.new params[:safety_test]
    if @safety_test.save
      flash[:notice] = 'Safety test added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @safety_test.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    test = SafetyTest.find(params[:id])
    student_id = test.student_id
    test.destroy
      flash[:notice] = 'Safety test deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
