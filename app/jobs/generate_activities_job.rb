class GenerateActivitiesJob < ApplicationJob
  queue_as :default

  def perform(trip, prompt, category)
    trip.call_gpt(prompt, category)
  end
end
