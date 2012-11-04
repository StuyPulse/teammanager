class TripFeesController < ApplicationController
  def new
    @trip_fee = TripFee.new
  end

  def create
    @trip_fee = Student.find(params[:student_id]).trip_fees.new params[:trip_fee]
    if @trip_fee.save
      flash[:notice] = 'Trip fee added successfully.'
      redirect_to controller: 'students', action: 'show', id: params[:student_id]
    else
      flash.now[:alert] = @trip_fee.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def destroy
    fee = TripFee.find(params[:id])
    student_id = fee.student_id
    fee.destroy
    flash[:notice] = 'Trip fee deleted successfully.'
    redirect_to controller: 'students', action: 'show', id: student_id
  end
end
