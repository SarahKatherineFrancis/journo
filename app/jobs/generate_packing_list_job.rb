class GeneratePackingListJob < ApplicationJob
  queue_as :default

  def perform(trip)
    client = OpenAI::Client.new
    packing_prompt = "I would like a recommended packing list for
    #{trip.destination}. Give a short reason for each item based on the destination.
    Format this as a HTML list"
    packing_response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: packing_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    packing = packing_response.parsed_response['choices'][0]['text']
    trip.update(packing_list: packing)
  end
end
