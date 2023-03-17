class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :trip_name, :destination, :start_date, :end_date, presence: true

  after_commit :generate_activities, on: :create

  def call_gpt(prompt, category)
    client = OpenAI::Client.new
    explore_response = client.completions(
      parameters: {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: 200,
        temperature: 0.1
      }
    )

    explore_infos = explore_response.parsed_response['choices'][0]['text']
    activities = JSON.parse(explore_infos)

    activities.each do |info|
      Activity.create(name: info['name'], description: info['description'], category: category,
                      trip: self)
    end
  end

  def generate_activities
    destination = self.destination
    eat_preference = user.eat_preference_list
    do_preference = user.do_preference_list

    p destination
    p eat_preference
    p do_preference

    explore_prompt = "You are a travel consultant. recommend the 3 best activities in #{destination}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    eat_prompt = "You are a travel consultant. recommend the 3 best restaurants in #{destination} that are: #{eat_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    do_prompt = "You are a travel consultant. 3 best activities in #{destination} that involve: #{do_preference}.
    Response must be a JSON with inside an array of activities with only the keys called name, description and lat and lon."

    GenerateActivitiesJob.perform_later(self.id, eat_prompt, 0)
    GenerateActivitiesJob.perform_later(self.id, do_prompt, 1)
    GenerateActivitiesJob.perform_later(self.id, explore_prompt, 2)
  end
end
