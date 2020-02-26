class Projection < ApplicationRecord
  belongs_to :movie
  has_many :reservations
end
