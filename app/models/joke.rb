# app/models/joke.rb
class Joke < ApplicationRecord
    belongs_to :category, optional: true
    validates :setup, :punchline, presence: true
end