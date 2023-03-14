class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    redirect_to trips_path if @trip.save
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :trip_name, :user_id)
  end
end
