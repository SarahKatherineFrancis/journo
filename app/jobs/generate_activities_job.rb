class GenerateActivitiesJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    job.arguments.first.broadcast_update(locals: { markers: "[]" })
  end

  def perform(trip, prompt, category)
    trip.call_gpt(prompt, category)
  end
end
