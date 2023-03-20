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
end
