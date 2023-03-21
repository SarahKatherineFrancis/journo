class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :trip_name, :destination, :date_range, presence: true

  after_commit :generate_activities, on: :create
  # after_commit :generate_budget, on: :create

  @@client = OpenAI::Client.new

  # geocoded_by :address,
  # after_validation :geocode, if: :will_save_change_to_address?,

  def call_gpt(prompt, category)
    response = @@client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt:,
        max_tokens: 500,
        temperature: 0.1
      }
    )
    p response

    infos = response.parsed_response['choices'][0]['text']
    activities = JSON.parse(infos)

    p activities
    activities.each do |info|
      Activity.create(name: info['name'], description: info['description'], latitude: info['lat'], longitude: info['lon'], category:,

                      trip: self)
    end
  end

  def generate_activities
    destination = self.destination
    eat_preference = user.eat_preference_list
    do_preference = user.do_preference_list

    explore_prompt = "You are a travel consultant. recommend the 5 best activities in #{destination}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    eat_prompt = "You are a travel consultant. recommend the 5 best restaurants in #{destination} that are: #{eat_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    do_prompt = "You are a travel consultant. 5 best activities in #{destination} that involve: #{do_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    GenerateActivitiesJob.perform_later(self, eat_prompt, 0)
    GenerateActivitiesJob.perform_later(self, do_prompt, 1)
    GenerateActivitiesJob.perform_later(self, explore_prompt, 2)
  end



  # def ask_gpt(prompt)
  #   response = @@client.completions(
  #     parameters: {
  #       model: "text-davinci-003",
  #       prompt: prompt,
  #       max_tokens: 2000,
  #       temperature: 0.1
  #     }
  #   )
  #    response = response.parsed_response['choices'][0]['text']
  # end

  # def generate_budget
  #   budget_prompt = "I would like a suggested daily and total budget for visiting
  #   #{self.destination} between #{self.start_date} and #{self.end_date}. Format this as a HTML list"

  #   GenerateBudgetJob.perform_later(self, budget_prompt)
  # end

  # def generate_packing_list
  #   packing_prompt = "I would like a recommended packing list for
  #   #{self.destination} between #{self.start_date} and #{self.end_date}. Give a short reason for each item.
  #   Format this as a HTML list"

  #   GeneratePackingJob.perform_later(self, packing_prompt)
  # end

  # def generate_itinerary
  #   itinerary_prompt = "I am going on a trip to #{self.destination}.
  #   I leave on #{self.start_date} and return on #{self.end_date}.
  #   I want to visit: #{self.activities.where(category: :do)}.
  #   I want to eat at: #{self.activities.where(category: :eat)}.
  #   Each day should suggest at least one restaurant and one activity.
  #   Do not repeat an item.
  #   Suggest me an itinerary clearly showing restaurants and activities.
  #   Please format the response in a HTML list."

  #   GenerateItineraryJob.perform_later(self, itinerary_prompt)
  # end
end
