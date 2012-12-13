class ParentPermissionFormsController < ApplicationController
  def new
    @parent_permission_form = ParentPermissionForm.new
  end

  def create
    @parent_permission_form = Student.find(params[:student_id]).parent_permission_forms.new params[:parent_permission_form]
    if @parent_permission_form.save
      flash[:notice] = 'Parent permission form added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @parent_permission_form.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    form = ParentPermissionForm.find(params[:id])
    student_id = form.student_id
    form.destroy
    flash[:notice] = 'Parent permission form deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
