class ActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    destination = @trip.destination
    @user = current_user
    eat_preference = @user.eat_preference_list
    do_preference = @user.do_preference_list

    client = OpenAI::Client.new
    prompt = "I am traveling to #{destination}. Suggest a #{eat_preference} restuarants, 3 activities involving
    #{do_preference} and 3 top things to explore with descriptions."

    response = client.completions(
      parameters: {
        model: 'text-davinci-001',
        prompt: prompt,
        max_tokens: 200
      }
    )

    @response = response["choices"][0]
  end
end
