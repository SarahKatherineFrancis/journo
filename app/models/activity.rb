class Activity < ApplicationRecord
  belongs_to :trip
  has_many :notes, dependent: :destroy

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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
