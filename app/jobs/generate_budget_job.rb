class GenerateBudgetJob < ApplicationJob
  queue_as :default

  def perform(trip)
    client = OpenAI::Client.new
    budget_prompt = "I would like a suggested daily and total budget for visiting
    #{trip.destination} between #{(trip.end_date - trip.start_date).to_i}. Please give
    a short piece of budget advice based on the destination.
    Format your response as a HTML list and use the destination currency."
    budget_response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: budget_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    budget = budget_response.parsed_response['choices'][0]['text']
    trip.update(budget: budget)
  end
end
