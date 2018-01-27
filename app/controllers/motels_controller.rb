class MotelsController < ApplicationController

  def show
    @motel = Motel.find(params[:id])
    authorize @motel
    @rooms = @motel.rooms
    @earnings = @rooms.joins(:bookings).sum(:amount_centavos_earned)
  end

  def index
    @user = current_user
    @motels = @user.motels
    @motels = policy_scope(Motel)
    @earnings = @motels.joins(:bookings).sum(:amount_centavos_earned)
  end
end
