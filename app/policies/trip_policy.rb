class TripPolicy < ApplicationPolicy
  def dashboard?
    @user.is_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
