class BookingsController < ApplicationController

  def index
    @bookings = Booking.joins(:resource).where(:bookings => {:user_id => current_user})
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: "Booking has been succesfully added!"
    else
      redirect_to @booking, alert: "Booking failed!"
    end
end

def booking_params
  params.require(:booking).permit(:date_from, :date_to, :total_price)
end
end
