class Room < ApplicationRecord
  belongs_to :resource

  validates :name, presence: true
  validates :price_per_night, numericality: { greater_than: 0 }
  validates :no_of_beds, numericality: { greater_than_or_equal_to: 1 }
end
