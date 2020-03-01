class Projection < ApplicationRecord
  belongs_to :movie
  has_many :reservations, dependent: :destroy
  validates :movie_id, uniqueness: { scope: :showtime }

  scope :by_day, ->(date = Time.now) { where(showtime: date) }
end
