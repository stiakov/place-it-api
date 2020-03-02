class User < ApplicationRecord
  validates_presence_of :name, :mobile, :email, :id_number
  validates :id_number, uniqueness: true
  has_many :reservations, dependent: :destroy
end
