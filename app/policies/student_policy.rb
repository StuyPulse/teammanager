class StudentPolicy < ApplicationPolicy

  def permitted_attributes
    if @user.is_admin?
      [:first_name, :last_name, :preferred_name, :grad_year, :osis, :email, :phone, :team_id, :gender, :avatar]
    elsif (@user == @record.user)
      [:preferred_name, :phone, :team_id, :gender, :avatar]
    end
  end

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
    @user.is_admin? || (@user == @record.user)
  end

  def informs?
    @user.is_admin? || (@user == @record.user)
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
