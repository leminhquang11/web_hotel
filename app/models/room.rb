class Room < ApplicationRecord
  belongs_to :hotel
  has_many :room_images, dependent: :destroy
  has_many :images, through: :room_images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
