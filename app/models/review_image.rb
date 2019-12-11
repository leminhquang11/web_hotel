class ReviewImage < ApplicationRecord
  belongs_to :service_review
  mount_uploader :link,  AvatarUploader
end
