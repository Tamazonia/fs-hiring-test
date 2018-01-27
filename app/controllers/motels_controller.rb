class MotelsController < ApplicationController

  def show
    @motel = Motel.find(params[:id])
    @rooms = @motel.rooms
    @earnings = @rooms.joins(:bookings).sum(:amount_centavos_earned)
  end

  def index
    @user = current_user
    @motels = @user.motels
    @earnings = @motels.joins(:bookings).sum(:amount_centavos_earned)
  end
end
