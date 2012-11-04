class TeacherPermissionFormsController < ApplicationController
  def new
    @teacher_permission_form = TeacherPermissionForm.new
  end

  def create
    @teacher_permission_form = Student.find(params[:student_id]).teacher_permission_forms.new params[:teacher_permission_form]
    if @teacher_permission_form.save
      flash[:notice] = 'Teacher permission form added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @teacher_permission_form.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    form = TeacherPermissionForm.find(params[:id])
    student_id = form.student_id
    form.destroy
    flash[:notice] = 'Teacher permission form deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
