class Service < ApplicationRecord
  resourcify
  belongs_to :provider
  belongs_to :category
  belongs_to :place
  has_many :service_images, dependent: :destroy
  has_many :service_reviews
  scope :get_services, ->(place_id,start_time, end_time){where("place_id = ?", place_id).where("start_time = ?", start_time.to_datetime).where("end_time = ?", end_time.to_datetime)}
  scope :get_by_category, ->(id){where("category_id = ?", id)}
  scope :get_services_in_place, ->(id){where("place_id = ?", id)}
end

