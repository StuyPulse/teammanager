class SafetyTest < ApplicationRecord
  include Seasonal

  has_paper_trail

  belongs_to :student

  scope :passed, -> { where(is_passed: true) }
  scope :signed, -> { passed.where(is_signed: true) }

  before_validation :make_passed_if_signed

  validates :is_passed, inclusion: { in: [ true ] }, if: :is_signed

  protected
  def make_passed_if_signed
    self.is_passed = true if self.is_signed
  end
end
