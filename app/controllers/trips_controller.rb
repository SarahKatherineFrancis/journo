class TripsController < ApplicationController
  @@client = OpenAI::Client.new

  def index
    @user = current_user

    if params[:query].present?
      sql_query = "trip_name ILIKE :query OR destination ILIKE :query"
      @trips = Trip.where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.where(user_id: current_user.id)
    end
  end

  def new
    @trip = Trip.new
  end

  def show
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
    Do not repeat an item.
    Suggest me an itinerary clearly showing restaurants and activities.
    Please format the response in a HTML list.
    I would like a suggested daily and total budget in a seperate section.
    The list should have the following title (H4): 'Your recommended itinerary for #{@trip.destination}"

    response = @@client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: itinerary_prompt,
        max_tokens: 2000,
        temperature: 0.1
      }
    )
    @infos = response.parsed_response['choices'][0]['text']
    @note = Note.new
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
