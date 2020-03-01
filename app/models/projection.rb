class Projection < ApplicationRecord
  belongs_to :movie
  has_many :reservations

  scope :by_day, ->(date = Time.now) { where(showtime: date) }
end
