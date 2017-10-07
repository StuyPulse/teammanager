class SafetyTest < ApplicationRecord
  include Seasonal
  belongs_to :student

  before_validation :make_passed_if_signed

  validates :is_passed, inclusion: { in: [ true ] }, if: :is_signed

  protected
  def make_passed_if_signed
    self.is_passed = true if self.is_signed
  end
end
