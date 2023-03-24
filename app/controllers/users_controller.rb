class UsersController < ApplicationController
  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def show
    @user = current_user
    @trips = Trip.where(id: current_user)
    @popular_destinations = @user.popular_destinations
    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        info_window_html: render_to_string(partial: "/trips/info_window",
                                           locals: {
                                             trip:
                                           }),
        marker_html: render_to_string(partial: "/trips/marker", locals: { trip: })
      }
    end
  end
end
