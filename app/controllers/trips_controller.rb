class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @user = current_user
    @markers = @trips.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @activities = @trip.activities.where(status: :added)
    @note = Note.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_activities_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :trip_name, :destination)
  end
end
