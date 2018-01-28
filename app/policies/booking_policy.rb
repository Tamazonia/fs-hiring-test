class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user:user)
      user.bookings

      # scope.joins(motels: :bookings).where users: { id: user }
      # scope.joins(:motels).where(user:user)
      # scope.where(scope.motels.user:user)
      # scope.first.motel.user == user
      # user.motels. each do |motel|
      #   bookings = motel.bookings
      # end
      # scope.where(user:user.motels.select(:motel_id))
      # scope.where(:company_id => user.collections.select(:website_id))

      # scope.includes(:users).where(motels: { motel_id: bookings.motel_id })
      # scope.includes(:firm_connections).where(firm_connections: { user_id: user.id })
    end
  end
end
