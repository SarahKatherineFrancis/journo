class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @activities = Activity.all
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    redirect_to trip_activities_path if @trip.save
  end

  private

  def trip_params
    params.permit(:start_date, :end_date, :trip_name, :user_id)
  end
end
