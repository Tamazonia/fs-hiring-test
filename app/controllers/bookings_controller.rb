class BookingsController < ApplicationController

  def index
    # @motel = Motel.find(params[:motel_id])

    @user = current_user
    @bookings = @user.bookings
    @bookings = policy_scope(Booking)

    # @user.bookings =
    # @bookings = @motel.bookings
    # @bookings = policy_scope(Booking)

  end

end
