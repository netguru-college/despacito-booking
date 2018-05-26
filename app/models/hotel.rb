class Hotel < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
end
