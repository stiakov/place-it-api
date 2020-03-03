class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :projection

  scope :by_day, ->(date = Time.now) { joins(:projection).where(projections: { showtime: date }) }
end
