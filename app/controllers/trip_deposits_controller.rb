class TripDepositsController < ApplicationController
  def new
    @trip_deposit = TripDeposit.new
  end

  def create
    @trip_deposit = Student.find(params[:student_id]).trip_deposits.new params[:trip_deposit]
    if @trip_deposit.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Trip fee added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
    fee = TripDeposit.find(params[:id])
    student_id = fee.student_id
    fee.destroy
    redirect_to controller: 'students', action: 'show', id: student_id, message: 'Trip fee deleted succesfully.'
  end
end
