class ProjectionSerializer < ActiveModel::Serializer
  attributes :id, :movie, :reservations, :showtime
  belongs_to :movie, serializer: MovieSerializer
  has_many :reservations, serializer: ReservationSerializer
end
