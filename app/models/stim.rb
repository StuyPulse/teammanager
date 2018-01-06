class Stim < ApplicationRecord
  include Seasonal

  belongs_to :student

  has_paper_trail

  scope :has_guardian, -> { where(has_guardian: true) }
  scope :consented, -> { has_guardian.where(has_media_consent: true) }

  before_validation :set_has_guardian_if_has_media_consent

  validates :has_media_consent, inclusion: { in: [true, false] }
  validates :has_guardian, inclusion: { in: [ true, false ] }
  validates :has_guardian, inclusion: { in: [ true ] }, if: :has_media_consent

  protected
  def set_has_guardian_if_has_media_consent
    self.has_guardian = true if self.has_media_consent
  end
end
