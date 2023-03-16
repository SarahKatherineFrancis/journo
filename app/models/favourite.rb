class Favourite < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  def index
    @favourites = Activity.where(status: :favourite)
  end
end
