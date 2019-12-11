class ServiceBookingsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def new
        @payment_methods = PaymentMethod.all
        @service = Service.find_by(id:params[:service_id])
        total_price = (@service.price.to_f * params[:quantity].to_f).round(2)
        @jcart = {'quantity' => params[:quantity],
                  'service' => @service.attributes,
                    'unit_price'=> @service.price,
                    'total_price'=> total_price }
        render "book"
    end

    def create
        @booking = current_user.service_bookings.build booking_params
        @booking.save!
        @confirm_secret_key = "booking_id:" + @booking.id.to_s + "_" +
                      + "user_id:" + @booking.user_id.to_s + "_" +
                      + "service_id:" + @booking.service_id.to_s + "_" +
                      + "book at:" + @booking.created_at.to_s
        @booking.update_attributes confirm_secret_key: @confirm_secret_key
        # ConfirmBookingMailer.confirm_booking_mail(current_user,@booking).deliver
        render "confirm"
    end

    def payment
        @jcart = params[:jcart]
        service_id = @jcart['service']['id']
        @service = Service.find_by(id: service_id)
        render "payment"
    end

    def booking_params
        params.require(:service_booking).permit :user_id,
                                                :service_id,
                                                :booking_user,
                                                :booking_address,
                                                :quantity,
                                                :unit_price,
                                                :total_price,
                                                :payment_method_id,
                                                :booking_status_id
    end
end
