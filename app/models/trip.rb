class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :trip_name, :destination, :start_date, :end_date, presence: true
end
