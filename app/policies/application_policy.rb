class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.is_admin?
  end

  def show?
    scope.where(:id => record.id).exists? && @user.is_admin?
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
    @user.is_admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def rails_admin?(action)
    case action
      when :dashboard
        user.is_admin?
      when :index
        user.is_admin?
      when :new
        user.is_admin?
      when :show
        user.is_admin?
      when :edit
        user.is_admin?
      when :update
        user.is_admin?
      when :destroy
        user.is_admin?
      when :export
        user.is_admin?
      when :history
        user.is_admin?
      when :bulk_delete
        false
      when :show_in_app
        user.is_admin?
      else
        raise ::Pundit::NotDefinedError, "unable to find policy #{action} for #{record}."
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
