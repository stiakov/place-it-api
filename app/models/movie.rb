class Movie < ApplicationRecord
  has_many :reservations
  has_many :projections
end
