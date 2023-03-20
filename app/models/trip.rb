class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :trip_name, :destination, :start_date, :end_date, presence: true

  after_commit :generate_activities, on: :create
  @@client = OpenAI::Client.new

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

    explore_prompt = "You are a travel consultant. recommend the 3 best activities in #{destination}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    eat_prompt = "You are a travel consultant. recommend the 3 best restaurants in #{destination} that are: #{eat_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    do_prompt = "You are a travel consultant. 3 best activities in #{destination} that involve: #{do_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    GenerateActivitiesJob.perform_later(self, eat_prompt, 0)
    GenerateActivitiesJob.perform_later(self, do_prompt, 1)
    GenerateActivitiesJob.perform_later(self, explore_prompt, 2)
  end
end
