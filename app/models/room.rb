class Room < ApplicationRecord
  belongs_to :motel
  has_many :bookings
  # delegate :user, to: :room
end
