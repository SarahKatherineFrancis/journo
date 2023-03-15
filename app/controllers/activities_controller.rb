class ActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @eat = @trip.activities.where(category: :eat, status: :pending)
    @explore = @trip.activities.where(category: :explore, status: :pending)
    @do = @trip.activities.where(category: :do, status: :pending)
    @selected_activities = selected_activities
  end

  def selected_activities
    @trip = Trip.find(params[:trip_id])
    @selected_activities = @trip.activities.where(status: :added)
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.find(params[:activity_id])
  end

  private

  def activity_params
    params.require(:activity).permit(:status)
  end
end
