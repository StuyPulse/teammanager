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
      redirect_to controller: 'trips', action: 'show', id: @trip.id, message: 'Trip created successfully.'
    else
      render action: 'new'
    end
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]
    if @trip.update_attributes params[:trip]
      redirect_to action: 'show', message: 'Trip updated successfully.'
    else
      render action: 'edit'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    redirect_to controller: 'trips', action: 'index', message: 'Trip deleted successfully.'
  end
end
