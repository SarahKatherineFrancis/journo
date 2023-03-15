class ActivitiesController < ApplicationController
  def index
    sorted_activities
  end

  def sorted_activities
    @activities = Activity.all
    @eat = []
    @do = []
    @explore = []

    @activities.each do |activity|
      case activity.category
      when "eat"
        @eat << activity
      when "do"
        @do << activity
      when "explore"
        @explore << activity
      end
    end
  end
end
