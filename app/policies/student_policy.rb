class StudentPolicy < ApplicationPolicy
  def dashboard?
    @user.is_admin?
  end

  def index?
    @user.is_admin?
  end

  def show?
    @user.is_admin? || (@user == @record.user)
  end

  def create?
    @user.is_admin?
  end

  def new?
    create?
  end

  def update?
    @user.is_admin?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
