class FavouritesController < ApplicationController

    def index
      if params[:query].present?
        sql_query = "name ILIKE :query OR description ILIKE :query"
        @favourites = Activity.where(status: :favourite).where(sql_query, query: "%#{params[:query]}%")
      else
        @favourites = Activity.where(status: :favourite)
      end
    end
  end
