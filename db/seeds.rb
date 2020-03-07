# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |i|
  Movie.create(name: "Movie #{i}")
end

(1..5).each do |i|
  Theatre.create(name: "Theatre #{i}", capacity: [50, 75, 100].sample)
end

(1..30).each do |i|
  Screening.create(
    movie_id: rand(1..10),
    theatre_id: rand(1..5),
    price: [35_000, 50_000, 100_000].sample,
    start_at: ["10:10", "12:15", "15:20", "18:00", "20:20", "22:10"].sample
  )
end
