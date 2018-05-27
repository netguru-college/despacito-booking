class Resource < ApplicationRecord
  has_many :bookings
  has_one :car
  has_one :room

  has_one_attached :image

  validates :name, presence: true
end
