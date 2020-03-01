class User < ApplicationRecord
  validates_presence_of :name, :mobile, :email, :id_number
  has_many :reservations, dependent: :destroy
end
