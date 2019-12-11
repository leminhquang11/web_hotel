class ScheduleItemImage < ApplicationRecord
    mount_uploader :link , AvatarUploader
    belongs_to :schedule_item
end
