class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @user = current_user
  end



end
