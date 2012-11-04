class MedicalFormsController < ApplicationController
  def new
    @medical_form = MedicalForm.new
  end

  def create
    @medical_form = Student.find(params[:student_id]).medical_forms.new params[:medical_form]
    if @medical_form.save
      flash[:notice] = 'Medical form added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @medical_form.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    form = MedicalForm.find(params[:id])
    student_id = form.student_id
    form.destroy
    flash[:notice] = 'Medical form deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
