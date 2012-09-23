class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find params[:id]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
