class GeneratePopularDestinationJob < ApplicationJob
  queue_as :default

  def perform(user)
    client = OpenAI::Client.new
    prompt = "You are a travel consultant. recommend the 3 top travel destinations that best suit someone living in #{user.location}.
    Response must be an ruby array!."
    response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    p response

    infos = response.parsed_response['choices'][0]['text']
    p infos
    popular_destinations = JSON.parse(infos)
    p popular_destinations
    user.update(popular_destinations: popular_destinations)
  end
end
