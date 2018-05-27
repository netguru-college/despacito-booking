class Resource < ApplicationRecord
  has_one :car
  has_one :room

  has_one_attached :image
end
