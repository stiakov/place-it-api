class Projection < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy

  scope :by_day, ->(date = Time.now) { where(showtime: date) }
end
