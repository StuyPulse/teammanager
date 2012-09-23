class SafetyTestsController < ApplicationController
  def new
    @safety_test = SafetyTest.new
  end

  def create
    @safety_test = Student.find(params[:student_id]).safety_tests.new params[:safety_test]
    if @safety_test.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Safety test added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
  end
end
