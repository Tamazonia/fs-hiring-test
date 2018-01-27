class MotelsController < ApplicationController

  def show
  end

  def index
    @user = current_user
    @motels = @user.motels
    @earnings = @motels.joins(:bookings).sum(:amount_centavos_earned)
  end
end
