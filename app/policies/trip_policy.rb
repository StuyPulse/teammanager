class TripPolicy < ApplicationPolicy
  def index?
    @user.is_admin?
  end

  def dashboard?
    @user.is_admin?
  end

  def import?
    @user.is_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
