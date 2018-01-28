class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user:user)
      user.bookings
    end
  end
end
