require 'faker'

# Optionally clear existing records to avoid duplicates
Joke.delete_all
Fact.delete_all
Category.delete_all

# Create categories
categories = %w[General Science History Humor]
categories.each { |name| Category.create(name: name) }

# Generate jokes
50.times do
  Joke.create(
    setup: Faker::TvShows::MichaelScott.quote,
    punchline: Faker::TvShows::MichaelScott.quote,
    category: Category.all.sample
  )
end

# Generate facts
150.times do
  Fact.create(
    fact: Faker::TvShows::MichaelScott.quote,
    category: Category.all.sample
  )
end
