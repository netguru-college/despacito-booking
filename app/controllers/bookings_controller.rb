class BookingsController < ApplicationController
  
  def index
    @bookings = Booking.joins(:resource).where(:bookings => {:user_id => current_user})
  end
end
