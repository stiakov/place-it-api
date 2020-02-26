class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :email, :id_number, :reservations
  has_many :reservations, serializer: ReservationSerializer
end
