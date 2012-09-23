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
      redirect_to controller: 'trips', action: 'show', id: @trip.id, message: 'Trip successfully created.'
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
      redirect_to @trip
    else
      render action: 'edit'
    end
  end

  def destroy
  end
end
