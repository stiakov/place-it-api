class Movie < ApplicationRecord
  validates_presence_of :title, :plot, :poster
  has_many :projections, dependent: :destroy
end
