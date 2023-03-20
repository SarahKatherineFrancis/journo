class TripsController < ApplicationController
  @@client = OpenAI::Client.new

  def index
    @trips = Trip.where(user_id: current_user.id)
    @user = current_user
  end

  def new
    @trip = Trip.new
  end

  def show
    @note = Note.new
    @trip = Trip.find(params[:id])
    @activities = @trip.activities.where(status: :added)

    restaurants = @activities.where(category: :eat)
    activity_restaurants = @activities.map(&:name)

    dos = @activities.where(category: :do)
    activity_dos = @activities.map(&:name)

    exps = @activities.where(category: :explore)
    activity_exps = @activities.map(&:name)

    itinerary_prompt = "I am going on a trip to #{@trip.destination}.
    I leave on #{@trip.start_date} and return on #{@trip.end_date}.
    I want to visit: #{activity_dos.append(activity_exps)}.
    I want to eat at: #{activity_restaurants}.
    Each day should suggest at least one restaurant and one activity.
    Do not repeat an item.
    Suggest me an itinerary clearly showing restaurants and activities.
    Please format the response in a HTML list."

    response = @@client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: itinerary_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    @infos = response.parsed_response['choices'][0]['text']

    budget_prompt = "I would like a suggested daily and total budget for visiting
    #{@trip.destination} between #{@trip.start_date} and #{@trip.end_date}. Format this as a HTML list"

    response = @@client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: budget_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    @budget = response.parsed_response['choices'][0]['text']
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_activities_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :trip_name, :destination)
  end
end
