class TripDepositsController < ApplicationController
  def new
    @trip_deposit = TripDeposit.new
  end

  def create
    @trip_deposit = Student.find(params[:student_id]).trip_deposits.new params[:trip_deposit]
    if @trip_deposit.save
      flash[:notice] = 'Trip deposit added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @trip_deposit.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    fee = TripDeposit.find(params[:id])
    student_id = fee.student_id
    fee.destroy
    flash[:notice] = 'Trip deposit deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
