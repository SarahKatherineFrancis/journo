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
    @activities = @trip.activities.where(status: [:added, :favourite])

    restaurants = @activities.where(category: :eat).pluck(:name)
    dos = @activities.where(category: :do).pluck(:name)
    exps = @activities.where(category: :explore).pluck(:name)

    activity_names = (dos + exps).uniq

    if @trip.itinerary.nil?
      itinerary_prompt = "I am going on a trip to #{@trip.destination}.
      The itinerary must be for #{(@trip.end_date - @trip.start_date).to_i} days.
      I want to visit: #{activity_names}.
      I want to eat at: #{restaurants}.
      Each day should suggest at least one restaurant and one activity.
      Do not repeat an item.
      The itinerary clearly shows restaurants and activities.
      The itinerary does not have to include everything.
      Please format the response in a HTML list."

      itinerary_response = @@client.completions(
        parameters: {
          model: "text-davinci-003",
          prompt: itinerary_prompt,
          max_tokens: 2000,
          temperature: 0.1
        }
      )
      itinerary = itinerary_response.parsed_response['choices'][0]['text']
      @trip.update(itinerary: )
    end
  end

  def create
    date_range = params[:date_range]
    start_date = Date.parse(date_range.split[0])
    end_date = Date.parse(date_range.split[2])

    date_range_hash = { start_date:, end_date: }

    full_params_trip = trip_params.merge(date_range_hash)
    @trip = Trip.new(full_params_trip)
    @trip.user = current_user
    if @trip.save
      @note = Note.create(note: "Write your memories here!", user: current_user, trip: @trip)
      redirect_to trip_activities_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_name, :destination)
  end
end
