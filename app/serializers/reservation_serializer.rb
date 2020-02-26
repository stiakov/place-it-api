class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user, :projection
  belongs_to :user, serializer: UserSerializer
  belongs_to :projection, serializer: ProjectionSerializer
end
