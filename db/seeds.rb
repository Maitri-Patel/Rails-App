# require 'faker'

# # Optionally clear existing records to avoid duplicates
# Joke.delete_all
# Fact.delete_all
# Category.delete_all

# # Create categories
# categories = %w[General Science History Humor]
# categories.each { |name| Category.create(name: name) }

# # Generate jokes
# 50.times do
#   Joke.create(
#     setup: Faker::TvShows::MichaelScott.quote,
#     punchline: Faker::TvShows::MichaelScott.quote,
#     category: Category.all.sample
#   )
# end

# # Generate facts
# 150.times do
#   Fact.create(
#     fact: Faker::TvShows::MichaelScott.quote,
#     category: Category.all.sample
#   )
# end
require 'csv'
require 'faker'
require 'smarter_csv'

# Assuming categories are predefined or you may add them as needed
categories = ["Nature & Animals", "Science & Technology", "History & Culture"]
categories.each { |name| Category.find_or_create_by!(name: name) }

# Generate Jokes using Faker
50.times do
  Joke.create!(
    setup: Faker::TvShows::MichaelScott.quote,
    punchline: Faker::TvShows::MichaelScott.quote,
    category: Category.order('RANDOM()').first # Randomly assign a category
  )
end

# Import Facts from CSV
facts_csv_path = Rails.root.join('lib', 'seeds', 'facts.csv')
SmarterCSV.process(facts_csv_path).each do |row|
  Fact.create!(
    fact: row[:fact],
    category: Category.order('RANDOM()').first # Randomly assign a category
  )
end
