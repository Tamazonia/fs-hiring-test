class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = @user.bookings
    @bookings = policy_scope(Booking)
  end
end
