class PackingJob < ApplicationJob
  queue_as :default

  def perform(trip, prompt)
    trip.ask_gpt(prompt)
  end
end
