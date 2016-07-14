# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

publishers = 5.times.map do
  Publisher.create!(name: Faker::Company.name, description: Faker::Company.catch_phrase)
end

100.times do
  start_year = (1909..Time.now.year-60).to_a.sample
  Series.create!(
    name: Faker::Superhero.name,
    description: Faker::Hipster.paragraphs(2).join("\n\n"),
    publisher: publishers.sample,
    year_start: start_year
  )
end
