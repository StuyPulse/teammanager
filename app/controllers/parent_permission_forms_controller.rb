class ParentPermissionFormsController < ApplicationController
  def new
    @parent_permission_form = ParentPermissionForm.new
  end

  def create
    @parent_permission_form = Student.find(params[:student_id]).parent_permission_forms.new params[:parent_permission_form]
    if @parent_permission_form.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Parent permission form added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
    form = ParentPermissionForm.find(params[:id])
    student_id = form.student_id
    form.destroy
    redirect_to controller: 'students', action: 'show', id: student_id, message: 'Parent permission form deleted succesfully.'
  end
end
