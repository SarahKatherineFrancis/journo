class UsersController < ApplicationController

  def index
    @trips = Trip.where(user_id: current_user.id)
  #   @markers = @trips.geocoded.map do |trip|
  #     {
  #       lat: trip.latitude,
  #       lng: trip.longitude,
  #       info_window_html: render_to_string(partial: "/trips/info_window",
  #                                          locals: {
  #                                            trip:
  #                                          }),
  #       marker_html: render_to_string(partial: "/trips/marker", locals: { trip: })
  #     }
  #   end
  # end
  def show
    @user = current_user
    @trip = Trip.all.where(id: current_user)
    @trips = Trip.all
  end
end
