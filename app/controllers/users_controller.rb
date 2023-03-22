class UsersController < ApplicationController
  def show
    @user = current_user
    @trip = Trip.all.where(id: current_user)
    @trips = Trip.all
  end
end

