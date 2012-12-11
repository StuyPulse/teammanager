class TeamDuesController < ApplicationController
  def new
    @team_due = TeamDue.new
  end
  
  def create
    @team_due = Student.find(params[:student_id[).team_dues.new params[:team_due]
    if @team_due.save
      flash[:notice] = "Team Due added successfully."
      redirect_to_controller: "students", action: "show", id: params[:student_id]
    else
      flash.now[:alert] = @team_dues.errors.full_messages.join('<br>').html_safe
      render action: "new"
    end
  end
  
  def destroy
    due = TeamDue.find(params[:id])
    student_id = due.student_id
    due.destroy
    flash[:notice] = "Team due deleted successfully."
    redirect_to_controller: "students", action: "show", id: student_id
  end
end
