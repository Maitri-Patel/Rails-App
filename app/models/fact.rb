# app/models/fact.rb
class Fact < ApplicationRecord
    belongs_to :category, optional: true
    validates :fact, presence: true
end