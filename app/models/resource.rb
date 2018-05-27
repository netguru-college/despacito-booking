class Resource < ApplicationRecord
  has_one :car
  has_one :room

  has_many_attached :image
end
