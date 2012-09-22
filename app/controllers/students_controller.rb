class StudentsController < ApplicationController
  def index
    @students = Student.order 'last_name'
  end

  def show
    @student = Student.find params[:id]
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new params[:student]
    if @student.save
      redirect_to @student
    else
      render action: 'new'
    end
  end

  def edit
    @student = Student.find params[:id]
  end

  def update
    @student = Student.find params[:id]
    if @student.update_attributes params[:student]
      redirect_to @student
    else
      render action: 'edit'
    end
  end

  def destroy
  end
end
