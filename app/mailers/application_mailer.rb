class ApplicationMailer < ActionMailer::Base
  default from: "tripbrick"

  def confirm_booking_mail user, booking
    @user = user
    @booking = booking
    mail to: @user.email, subject: "Confirm Booking Mail"
  end
end
