module Nameable
  extend ActiveSupport::Concern

  def full_name
    "#{first_name} #{last_name}"
  end
  alias_method :name, :full_name
end
