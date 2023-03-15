class ActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    destination = @trip.destination
    @user = current_user
    eat_preference = @user.eat_preference_list
    do_preference = @user.do_preference_list

    client = OpenAI::Client.new
    eat_prompt = "I am traveling to #{destination}. Can you suggest 3 restaurants that are #{eat_preference}? Response must be in a ruby hash with the keys name:, description:,  category: 0 and status: 0"
    do_prompt = "I am traveling to #{destination}. Can you suggest 3 activities that involve #{do_preference}? Response
    must include name and description"
    explore_prompt = "I am traveling to #{destination}. Can you suggest the top 3 things to explore in the area?
    Response must include name and description"

    eat_response = client.completions(
      parameters: {
        model: 'gpt-4',
        prompt: eat_prompt,
        max_tokens: 600
      }
    )

    do_response = client.completions(
      parameters: {
        model: 'text-davinci-001',
        prompt: do_prompt,
        max_tokens: 300
      }
    )

    explore_response = client.completions(
      parameters: {
        model: 'text-davinci-001',
        prompt: explore_prompt,
        max_tokens: 300
      }
    )

    @eat_response = eat_response["choices"][0]["text"]
  end
end
