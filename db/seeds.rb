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

activity1 = Activity.create!(
  name: 'Plant Cafe',
  description: 'This vegan cafe in Cape Town serves a range of delicious plant-based meals, including burgers, salads,
   and smoothies. They also have outdoor seating that is dog-friendly, so you can bring your furry friend along while
    you enjoy your meal.',
  type: 0,
  status: 0,
  trip: trip
)

puts "created activity with the type: #{activity1.type}"
