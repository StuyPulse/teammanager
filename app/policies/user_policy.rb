class UserPolicy < ApplicationPolicy
  def create?
    false
  end

  def new?
    false
  end

  def update?
    false
  end

  def edit?
    false
  end

  def destroy?
    false
  end

  def rails_admin?(action)
    case action
      when :dashboard
        user.is_admin?
      when :index
        user.is_admin?
      when :show
        user.is_admin?
      when :new
        false
      when :edit
        false
      when :destroy
        false
      when :export
        user.is_admin?
      when :history
        false
      when :show_in_app
        user.is_admin?
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
