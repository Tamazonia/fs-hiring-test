class Motel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :bookings
end
