class Activity < ApplicationRecord
  belongs_to :trip
  has_many :notes, dependent: :destroy

  geocoded_by :address
  # geocoded_by :longitude, :latitude

  enum category: {
    eat: 0,
    do: 1,
    explore: 2
  }

  enum status: {
    pending: 0,
    favourite: 1,
    added: 2
  }

  scope :pending_eat, -> { where(category: :eat, status: :pending) }
  scope :pending_do, -> { where(category: :do, status: :pending) }
  scope :pending_explore, -> { where(category: :explore, status: :pending) }
  scope :selected, -> { where(status: :added) }

  # def self.generate_markers_json(activities)
  #   ac = ActionController::Base.new()
  #   activities.geocoded.map do |activity|
  #     {
  #       lat: activity.latitude,
  #       lng: activity.longitude,
  #       info_window_html: ac.render_to_string(partial: "/trips/info_window",
  #                                          locals: {
  #                                            activity:
  #                                          }),
  #       marker_html: ac.render_to_string(partial: "/shared/marker", locals: { activity: })
  #     }
  #   end.to_json
  # end
end
