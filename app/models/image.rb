class Image < ApplicationRecord
  has_one :hotel_image, dependent: :destroy
  has_one :hotel, through: :hotel_image
  mount_uploader :image, ImageUploader
end
