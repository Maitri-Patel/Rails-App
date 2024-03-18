# app/models/category.rb
class Category < ApplicationRecord
    has_many :jokes
    has_many :facts
    validates :name, presence: true, uniqueness: true
end
