# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first
User.destroy_all

puts "creating a user"

user = User.create!(
  email: 'john@example.com',
  password: 'password123',
  first_name: 'John',
  last_name: 'Doe',
  age: 30,
  location: 'New York City',
  bio: 'I am a software engineer with a passion for coding.',
  profile_picture: 'https://example.com/profile-picture.jpg',
  eat_preferences: ['Vegan-friendly', 'Pet-friendly'],
  do_preferences: ['Hiking', 'Surfing']
)

puts "created user with email: #{user.email}"

puts "creating a trip"

trip = Trip.create!(
  trip_name: "Cape Town Adventure",
  destination: "Cape Town",
  start_date: Date.new(2023, 6, 1),
  end_date: Date.new(2023, 6, 10),
)
