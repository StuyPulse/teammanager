class TeamDuesController < ApplicationController
  def new
    @team_due = TeamDue.new
    @team_due.student_id = params[:student_id]
    @team_due.year = params[:year]
    @team_due.save
  end
  
  def create
    @team_due = Student.find(params[:student_id]).team_dues.new params[:team_due]
    if @team_due.save
      flash[:notice] = 'Team Due added successfully.'
      redirect_to controller: 'students', action: "show", id: params[:student_id]
    else
      flash.now[:alert] = @team_dues.errors.full_messages.join('<br>').html_safe
      render action: "new"
    end
  end
  
  def destroy
    due = TeamDue.find(params[:id])
    student = due.student
    due.destroy
    respond_to do |format|
      format.html {redirect_to student, notice: "Team Due deleted."}
      format.js {render nothing: true}
    end
  end
end
