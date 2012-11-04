class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find params[:id]
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new params[:trip]
    if @trip.save
      flash[:notice] = 'Trip created successfully.'
      redirect_to controller: 'trips', action: 'show', id: @trip.id
    else
      flash.now[:alert] = @trip.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]
    if @trip.update_attributes params[:trip]
      flash[:notice] = 'Trip updated successfully.'
      redirect_to action: 'show'
    else
      flash.now[:alert] = @trip.errors.full_messages.join('<br>').html_safe
      render action: 'edit'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:notice] = 'Trip deleted successfully.'
    redirect_to controller: 'trips', action: 'index'
  end
end
