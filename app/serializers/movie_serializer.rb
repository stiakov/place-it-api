class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :poster, :projections
  has_many :projections, serializer: ProjectionSerializer
end
