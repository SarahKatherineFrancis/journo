class UsersController < ApplicationController
  def show
    @user = current_user
    @trip = Trip.find(params[:id])
  end
end
