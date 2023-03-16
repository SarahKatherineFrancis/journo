class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :trip_name, :destination, :start_date, :end_date, presence: true

  after_commit :generate_activities, on: :create

  def generate_activities
    generate_eat_activities
    generate_do_activities
    generate_explore_activities
  end

  def generate_eat_activities
    destination = self.destination
    eat_preference = user.eat_preference_list

    eat_prompt = "Can you give me a name of a restuarant that is #{eat_preference} in #{destination}? Just one and just the name!"

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: eat_prompt }],
        temperature: 0.7
      }
    )

    eat_name = response.dig("choices", 0, "message", "content")

    eat_description_prompt = "Can you give me a 30 word description of the place? Just the description!"

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: eat_prompt }, { role: "system", content: eat_name }, { role: "user", content: eat_description_prompt }],
        temperature: 0.7
      }
    )

    eat_description = response.dig("choices", 0, "message", "content")

    Activity.create(name: eat_name, description: eat_description, category: :eat, trip: self)
  end

  def generate_do_activities
    destination = self.destination
    do_preference = user.do_preference_list

    do_prompt = "Can you give me a name of an activity that is #{do_preference} in #{destination}? Just one and just the name!"

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: do_prompt }],
        temperature: 0.7
      }
    )

    do_name = response.dig("choices", 0, "message", "content")

    do_description_prompt = "Can you give me a 30 word description of the place? Just the description!"

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: do_prompt }, { role: "system", content: do_name }, { role: "user", content: do_description_prompt }],
        temperature: 0.7
      }
    )

    do_description = response.dig("choices", 0, "message", "content")

    Activity.create(name: do_name, description: do_description, category: :do, trip: self)
  end

  def generate_explore_activities
    destination = self.destination

    explore_prompt = "Can you give me a name of the top thing to do in #{destination}? Just one and just the name!"

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: explore_prompt }],
        temperature: 0.7
      }
    )

    explore_name = response.dig("choices", 0, "message", "content")

    explore_description_prompt = "Can you give me a 30 word description of the place? Just the description!"

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: explore_prompt }, { role: "system", content: explore_name }, { role: "user", content: explore_description_prompt }],
        temperature: 0.7
      }
    )

    explore_description = response.dig("choices", 0, "message", "content")

    Activity.create(name: explore_name, description: explore_description, category: :explore, trip: self)
  end
end
