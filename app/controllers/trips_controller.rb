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
  end

  def update
  end

  def destroy
  end
end
