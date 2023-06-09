class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :destroy
  has_one_attached :photo

  acts_as_taggable_on :eat_preference, :do_preference

  after_commit :generate_popular_destinations, on: :create

  def generate_popular_destinations
    GeneratePopularDestinationJob.perform_later(self)
  end
end
