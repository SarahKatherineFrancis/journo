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
