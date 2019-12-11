class BookingStatus < ApplicationRecord
    has_many :service_bookings
end
