require 'csv'

class StudentsController < ApplicationController
  def index
    @students = Student.order :last_name
    respond_to do |format|
      format.csv {render :layout => false}
    end
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

  def csv 
    csv_string = CSV.generate do |csv|
      csv << ["Name", "Email"]
      Student.order(:last_name).each do |student|
        csv << [student.first_name + student.last_name, student.email]
      end
    end

    send_data csv_string, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=users.csv"
  end
end
