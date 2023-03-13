# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  first_name: "Alice",
  last_name: "Smith",
  destination: "Paris, France",
  start_date: Date.new(2023, 5, 15),
  end_date: Date.new(2023, 5, 23),
  activeness: "Very Active",
  food_preference: ["French", "Italian"],
  price_range: "Expensive",
  interests: ["Art", "History", "Architecture", "Fashion"]
)

User.create!(
  first_name: "Bob",
  last_name: "Jones",
  destination: "Tokyo, Japan",
  start_date: Date.new(2023, 7, 1),
  end_date: Date.new(2023, 7, 10),
  activeness: "Somewhat Active",
  food_preference: ["Japanese", "Korean", "Thai"],
  price_range: "Mid-Priced",
  interests: ["Anime", "Manga", "Technology", "Culture"]
)

User.create!(
  first_name: "Charlie",
  last_name: "Brown",
  destination: "Barcelona, Spain",
  start_date: Date.new(2023, 9, 15),
  end_date: Date.new(2023, 9, 22),
  activeness: "Active",
  food_preference: ["Spanish", "Mediterranean"],
  price_range: "Mid-Priced",
  interests: ["Beaches", "Architecture", "Nightlife", "Food"]
)

User.create!(
  first_name: "David",
  last_name: "King",
  destination: "New York City, USA",
  start_date: Date.new(2023, 10, 30),
  end_date: Date.new(2023, 11, 6),
  activeness: "Very Active",
  food_preference: ["American", "Italian"],
  price_range: "Expensive",
  interests: ["Theater", "Music", "Shopping", "Museums"]
)

User.create!(
  first_name: "Emily",
  last_name: "Pierce",
  destination: "Bangkok, Thailand",
  start_date: Date.new(2024, 1, 15),
  end_date: Date.new(2024, 1, 22),
  activeness: "Active",
  food_preference: ["Thai", "Vietnamese", "Chinese"],
  price_range: "Inexpensive",
  interests: ["Temples", "Markets", "Street Food", "Culture"]
)
