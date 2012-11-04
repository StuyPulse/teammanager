class TripFeesController < ApplicationController
  def new
    @trip_fee = TripFee.new
  end

  def create
    @trip_fee = Student.find(params[:student_id]).trip_fees.new params[:trip_fee]
    if @trip_fee.save
      redirect_to controller: 'students', action: 'show', id: params[:student_id], message: 'Trip fee added successfully.'
    else
      render action: 'new'
    end
  end

  def destroy
    fee = TripFee.find(params[:id])
    student_id = fee.student_id
    fee.destroy
    redirect_to controller: 'students', action: 'show', id: student_id, message: 'Trip fee deleted succesfully.'
  end
end
