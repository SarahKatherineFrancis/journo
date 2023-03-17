class GenerateActivitiesJob < ApplicationJob
  queue_as :default

  def perform(trip_id, prompt, category)
    trip = Trip.find(trip_id)
    trip.call_gpt(prompt, category)
  end
end
