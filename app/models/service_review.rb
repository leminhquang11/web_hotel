class ServiceReview < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :review_images, dependent: :destroy
  
  accepts_nested_attributes_for :review_images, allow_destroy: true,
    reject_if: proc{|attributes| attributes["image"].blank?}
end
