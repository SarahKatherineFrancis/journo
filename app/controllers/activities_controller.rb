class ActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @markers = Activity.generate_markers_json(@trip.activities.selected)
  end

  def added
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:id])
    @activity.added!
    redirect_to trip_activities_path(@trip)
  end

  def favourite
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:id])
    @activity.favourite!
    redirect_to trip_activities_path(@trip)
  end
end
