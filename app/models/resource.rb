class Resource < ApplicationRecord
  has_many :bookings
  has_one :car
  has_one :room
end
