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
        prompt:,
        max_tokens: 500,
        temperature: 0.1
      }
    )

    p explore_response

    explore_infos = explore_response.parsed_response['choices'][0]['text']
    activities = JSON.parse(explore_infos)

    activities.each do |info|
      Activity.create(name: info['name'], description: info['description'], category:,
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

    call_gpt(eat_prompt, 0)
    call_gpt(do_prompt, 1)
    call_gpt(explore_prompt, 2)
  end
end

# def restaurants
#   client = OpenAI::Client.new

#   destination = self.destination
#   eat_preference = user.eat_preference_list
#   do_preference = user.do_preference_list

#   eat_response = client.chat(
#     parameters: {
#       model: "gpt-3.5-turbo-0301",
#       messages: [{ role: "user", content: eat_prompt }],
#       temperature: 0.7
#     }
#   )

#   eat_infos = eat_response.parsed_response['choices'][0]['message']['content']
#   p eat_infos
#   activities = JSON.parse(eat_infos)
#   activities.each do |info|
#     Activity.create(name: info['name'], description: info['description'], category: 0, trip: self)
#   end
# # end

# # def activities
# #   client = OpenAI::Client.new

# #   destination = self.destination
# #   eat_preference = user.eat_preference_list
# #   do_preference = user.do_preference_list

# #   do_prompt = `You are a travel consultant. recommend the 3 best activities in Cape Town that involve: coding. Response must be in a JSON that I can consume like this explore_infos = explore_response.parsed_response[0]['message']
# #   with only the keys called name and description.`

# #   do_response = client.chat(
# #     parameters: {
# #       model: "gpt-3.5-turbo-0301",
# #       messages: [{ role: "user", content: do_prompt }],
# #       temperature: 0.7
# #     }
# #   )

# #   do_infos = do_response.parsed_response['choices'][0]['message']
# #   p do_infos
# #   activities = JSON.parse(do_infos)
# #   if activities[0]['activities']
# #     activities.each do |info|
# #       Activity.create(name: info['activities']['name'], description: info['activities']['description'], category: 1,
# #                       trip: self)
# #     end
# #   else
# #     activities.each do |info|
# #       Activity.create(name: info['name'], description: info['description'], category: 1,
# #                       trip: self)
# #     end
# #   end
# # end

# # def general_activities
# #   client = OpenAI::Client.new

# #   destination = self.destination
# #   eat_preference = user.eat_preference_list
# #   do_preference = user.do_preference_list

# #   explore_prompt = "You are a travel consultant. recommend the 3 best activities in Cape Town. Response must be in a JSON, activities should be in a plain array and use string as keys, not hashes
# #   with only the keys called name and description."

# #   explore_response = client.chat(
# #     parameters: {
# #       model: "gpt-3.5-turbo-0301",
# #       messages: [{ role: "user", content: explore_prompt }],
# #       temperature: 0.3
# #     }
# #   )

# #   explore_infos = explore_response.parsed_response['choices'][0]['message']
# #   p explore_infos
# #   activities = JSON.parse(JSON.generate(explore_infos))
# #   if activities[0]['activities']
# #     activities.each do |info|
# #       Activity.create(name: info['activities']['name'], description: info['activities']['description'], category: 1,
# #                       trip: self)
# #     end
# #   else
# #     activities.each do |info|
# #       Activity.create(name: info['name'], description: info['description'], category: 1,
# #                       trip: self)
# #     end
# #   end
# # end

# def general_activities_davinci
#   client = OpenAI::Client.new

#   destination = self.destination
#   eat_preference = user.eat_preference_list
#   do_preference = user.do_preference_list

#   explore_prompt = "You are a travel consultant. recommend the 3 best activities in Cape Town.
#   Response must be a JSON with inside an array of activities with only the keys called name and description."

#   explore_response = client.completions(
#     parameters: {
#       model: "text-davinci-003",
#       prompt: explore_prompt,
#       max_tokens: 500,
#       temperature: 0.1
#     }
#   )

#   explore_infos = explore_response.parsed_response['choices'][0]['text']
#   p explore_infos
#   activities = JSON.parse(explore_infos)

#   # if activities['activities']
#   #   activities.each do |info|
#   #     Activity.create(name: info['activities']['name'], description: info['activities']['description'], category: 1,
#   #                     trip: self)
#   #   end
#   # elsif activities['Activities']
#   #   activities.each do |info|
#   #     Activity.create(name: info['Activities']['name'], description: info['Activities']['description'], category: 1,
#   #                     trip: self)
#   #   end
#   # else
#   activities.each do |info|
#     Activity.create(name: info['name'], description: info['description'], category: 2,
#                     trip: self)
#   end
#   # end
# end
