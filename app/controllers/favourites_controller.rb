class FavouritesController < ApplicationController
  def index
    @favourites = Activity.where(status: :favourite)
  end
end
