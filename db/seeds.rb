# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first
Activity.destroy_all
Trip.destroy_all
User.destroy_all

puts "creating a user"

user = User.create!(
  email: 'john@example.com',
  password: '123123',
  first_name: 'John',
  last_name: 'Doe',
  age: 30,
  location: 'New York City',
  bio: 'I am a software engineer with a passion for coding.',
  profile_picture: 'https://example.com/profile-picture.jpg'
)

puts "created user with email:#{user.email}"

puts "creating user eat and do preferences"
user.eat_preference_list.add("Vegan-friendly", "Pet-friendly")
user.do_preference_list.add("Hiking", "Swimming", "Coding")
user.save

puts "user has eat-preferences- #{user.eat_preference_list} and do-preferences- #{user.do_preference_list}"

puts "creating a trip for user"

trip = Trip.create!(
  trip_name: 'Cape Town Adventure',
  destination: 'Cape Town',
  start_date: Date.new(2023, 4, 20),
  end_date: Date.new(2023, 5, 20),
  user: user
)

puts "created trip for user with id:#{trip.user.id}"

puts "creating activities suggestions for the trip"

eat_activity1 = Activity.create!(
  name: 'Plant Cafe',
  description: 'This vegan cafe in Cape Town serves a range of delicious plant-based meals, including burgers, salads,
   and smoothies. They also have outdoor seating that is dog-friendly, so you can bring your furry friend along while
    you enjoy your meal.',
  category: 0,
  status: 0,
  trip: trip
)

eat_activity2 = Activity.create!(
  name: 'Raw and Roxy',
  description: 'Raw and Roxy is a vegan restaurant that specializes in raw, organic, and gluten-free cuisine. They have
  a range of delicious dishes, including smoothie bowls, salads, and vegan sushi. They also have outdoor seating that
  is dog-friendly.',
  category: 0,
  status: 0,
  trip: trip
)

eat_activity3 = Activity.create!(
  name: "Scheckter's Raw",
  description: "Scheckter's Raw is a vegan and organic restaurant that serves a range of delicious plant-based dishes,
  including burgers, salads, and smoothies. They also have outdoor seating that is dog-friendly, so you can enjoy your
  meal with your furry friend by your side.",
  category: 0,
  status: 0,
  trip: trip
)

do_activity1 = Activity.create!(
  name: "Hike up Table Mountain",
  description: "The hike to the top can be challenging but rewarding, with several trails to choose from depending on
  your fitness level and experience. Once at the top, take in the stunning views, have a picnic, and explore the many
  rock formations.",
  category: 1,
  status: 0,
  trip: trip
)

do_activity2 = Activity.create!(
  name: "Swim at Silvermine Nature Reserve",
  description: "Silvermine Nature Reserve is a beautiful conservation area located in the mountains above Cape Town.
  The reserve offers several hiking trails with stunning views, as well as a large reservoir that's perfect for swimming
   and picnicking.",
  category: 1,
  status: 0,
  trip: trip
)

do_activity3 = Activity.create!(
  name: "Attend a coding workshop at Le Wagon Cape Town",
  description: "Le Wagon is a world-renowned coding bootcamp that offers immersive courses in web development, data
  science, and more.",
  category: 1,
  status: 0,
  trip: trip
)

explore_activity1 = Activity.create!(
  name: "Table Mountain",
  description: "This iconic landmark is a must-visit attraction in Cape Town. You can hike up to the top or take the
  cable car and enjoy stunning panoramic views of the city, ocean, and surrounding landscape.",
  category: 2,
  status: 0,
  trip: trip
)

explore_activity2 = Activity.create!(
  name: "Robben Island",
  description: "A UNESCO World Heritage Site and a former political prison where Nelson Mandela was held for 18 years.
  You can take a ferry from the Victoria & Alfred Waterfront to explore the island and learn about South Africa's
  history.",
  category: 2,
  status: 0,
  trip: trip
)

explore_activity3 = Activity.create!(
  name: "Cape Peninsula",
  description: "A scenic drive along the Cape Peninsula offers breathtaking views of the Atlantic Ocean, mountains, and
  beaches. Don't miss the chance to visit Boulders Beach to see the African penguins, and Cape Point Nature Reserve to
  see the Cape of Good Hope.",
  category: 2,
  status: 0,
  trip: trip
)

puts "created activity with the type: #{eat_activity1.category}"
puts "created activity with the type: #{eat_activity2.category}"
puts "created activity with the type: #{eat_activity3.category}"
puts "created activity with the type: #{do_activity1.category}"
puts "created activity with the type: #{do_activity2.category}"
puts "created activity with the type: #{do_activity3.category}"
puts "created activity with the type: #{explore_activity1.category}"
puts "created activity with the type: #{explore_activity2.category}"
puts "created activity with the type: #{explore_activity3.category}"
