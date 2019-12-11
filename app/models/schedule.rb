class Schedule < ApplicationRecord
  belongs_to :user
  has_many :schedule_items, dependent: :destroy
end
