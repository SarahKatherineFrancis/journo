class ActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @eat = @trip.activities.where(category: :eat, status: :pending)
    @explore = @trip.activities.where(category: :explore, status: :pending)
    @do = @trip.activities.where(category: :do, status: :pending)
    @selected_activities = selected_activities
    @activities = @trip.activities.all
    @markers = selected_activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
        # info_window_html: render_to_string(partial: "/shared/info_window",
        #   locals: { activities: @activities, user: current_user, trip: @trip }),
        # marker_html: render_to_string(partial: "/shared/marker", locals: { activity: })
      }
      raise
    end
  end

  def selected_activities
    @trip = Trip.find(params[:trip_id])
    @selected_activities = @trip.activities.where(status: :added)
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
