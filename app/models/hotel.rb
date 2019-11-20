class Hotel < ApplicationRecord
  resourcify
  has_many :hotel_images, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :images, through: :hotel_images, dependent: :destroy
  accepts_nested_attributes_for :hotel_images, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
