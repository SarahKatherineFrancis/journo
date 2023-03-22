class GenerateVisaJob < ApplicationJob
  queue_as :default

  def perform(trip)
    client = OpenAI::Client.new
    visa_prompt = "I am a #{trip.user.nationality} National and travelling to #{trip.destination}.
    What are the visa requirements and necessary vaccines to travel for leisure? Display the response as a HTML list."
    visa_response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: visa_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    visa = visa_response.parsed_response['choices'][0]['text']
    trip.update(visa: visa)
  end
end
