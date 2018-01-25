class Room < ApplicationRecord
  belongs_to :motel
  has_many :bookings
end
