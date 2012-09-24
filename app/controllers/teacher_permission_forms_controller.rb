class TeacherPermissionFormsController < ApplicationController
  def new
    @teacher_permission_form = TeacherPermissionForm.new
  end

  def create
    @teacher_permission_form = Student.find(params[:student_id]).teacher_permission_forms.new params[:teacher_permission_form]
    if @teacher_permission_form.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Teacher permission form added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
    form = TeacherPermissionForm.find(params[:id])
    student_id = form.student_id
    form.destroy
    redirect_to controller: 'students', action: 'show', id: student_id, message: 'Teacher permission form deleted succesfully.'
  end
end
