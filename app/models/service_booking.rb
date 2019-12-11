class ServiceBooking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :payment_method
  belongs_to :booking_status

  before_create :set_booking_status

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :booking_address, presence: true
  validates :payment_method_id, presence: true
  validates :booking_user, presence: true
  validates :booking_status, presence: true

  def subtotal

  end

  def user_name
    self.user.name
  end

  def generate_qr text
    chart = GoogleQR.new(:data => "#{text}", :size => "250x250", :margin => 4, :error_correction => "L")
    return chart.to_s
  end

  private
  def set_booking_status
    self.booking_status_id = 1
  end

end
