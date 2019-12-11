class ScheduleItem < ApplicationRecord
  belongs_to :schedule
  belongs_to :category
  has_one :schedule_item_image, dependent: :destroy
end
