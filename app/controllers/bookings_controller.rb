class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = policy_scope(Booking).order(paid_at: :desc)
  end
end
