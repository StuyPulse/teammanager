class MedicalFormsController < ApplicationController
  def new
    @medical_form = MedicalForm.new
  end

  def create
    @medical_form = Student.find(params[:student_id]).medical_forms.new params[:medical_form]
    if @medical_form.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Medical form added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
  end
end
