class PaymentsController < ApplicationController
  before_action :find_booking
  skip_before_action :authenticate_user!


  def create
    @payment = Payment.new(booking_id: params[:booking_id], status: "unpaid")

    if @payment.save
      redirect_to @booking, notice: t('.success')
    else
      redirect_to @booking, alert: t('.alert')
    end
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      redirect_to @booking, notice: t('.success')
    else
      redirect_to @booking, alert: t('.alert')
    end
  end

  private
  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def payment_params
    params.require(:payment).permit(:status)
  end
end
