class Activity < ApplicationRecord
  belongs_to :trip
  has_many :notes, dependent: :destroy
end
