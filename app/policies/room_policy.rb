class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.rooms
    end

    def show?
      record.motel.user == user
    end
  end
end
