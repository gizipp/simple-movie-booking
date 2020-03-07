class Movie < ApplicationRecord
  has_many :screenings
  has_many :theatres, -> { distinct }, through: :screenings
end
