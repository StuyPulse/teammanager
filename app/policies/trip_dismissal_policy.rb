class TripDismissalPolicy < ApplicationPolicy

  def create?
    @user.is_admin?
  end
  
  def destroy?
    @user.is_admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
