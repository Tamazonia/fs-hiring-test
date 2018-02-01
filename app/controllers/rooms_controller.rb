class RoomsController < ApplicationController
  def show
    @user = current_user
    @room = Room.find(params[:id])
    authorize @room
    @bookings = @room.bookings.order(paid_at: :desc)
  end
end
