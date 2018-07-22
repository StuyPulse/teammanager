class Student < ApplicationRecord
  include Nameable

  has_paper_trail

  belongs_to :team, optional: true
  belongs_to :user, optional: true

  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :parents
  has_and_belongs_to_many :trips

  has_many :media_consents
  has_many :medicals
  has_many :safety_tests
  has_many :stims
  has_many :team_dues

  has_many :permission_slips
  has_many :payments

  has_many :services
  has_many :events, through: :services

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }

  auto_strip_attributes :first_name, :last_name, :preferred_name, :email, :team_email

  validates :first_name, :last_name, :grad_year, :osis, :email, :phone,
            presence: true, allow_blank: false
  validates :parents, presence: true
  validates :osis, length: { is: 9 },
                   numericality: { greater_than: 0,
                                   message: 'cannot be negative' }
  validates :gender, inclusion: { in: %w(Female Male Other) }
  validate :check_preferred_name

  phony_normalize :phone, default_country_code: 'US'

  # Enum for rails_admin create
  def gender_enum
    ['Female', 'Male', 'Other']
  end

  def is_graduated?
    # Assume students graduate on the last day of June
    Date.today > Date.new(grad_year, 6, -1)
  end

  def valid_forms(type)
    case type
    when :team_dues
      team_dues.valid
    when :medicals
      medicals.valid
    when :media_consents
      media_consents.valid
    when :stims
      stims.valid
    when :safety_tests
      safety_tests.valid
    end
  end

  def valid_forms_for_year(type, year)
    case type
    when :team_dues
      team_dues.valid_for(year)
    when :media_consents
      media_consents.valid_for(year)
    when :stims
      stims.valid_for(year)
    when :safety_tests
      safety_tests.valid_for(year)
    end
  end

  # A student will never have a permissions slip with
  # the same type and trip as another permission slip
  def find_permission_slip(type, trip_id)
    permission_slips.where(type: type, trip_id: trip_id).take
  end

  # A student will never have two payments for the same
  # payment requirement
  def find_payment(required_payment_id)
    payments.where(required_payment_id: required_payment_id).take
  end

  def eligible_for_trip(trip)
    # If the trip occurs after August, the student's forms must be valid
    # for the following year to be eligible for the trip
    year = trip.end_date.year
    if trip.end_date.month > 8
      year += 1
    end
    has_consented_stim = valid_forms_for_year(:stims, year).consented.any?
    has_signed_safety_test =
      valid_forms_for_year(:safety_tests, year).signed.any?
    valid_forms_for_year(:team_dues, year).any? &&
      valid_forms_for_year(:media_consents, year).any? &&
      medicals.good_for_trip(trip).any? &&
      has_consented_stim && has_signed_safety_test
  end

  rails_admin do
    create do
      exclude_fields :team_dues, :media_consents, :medicals, :events, :services,
                     :safety_tests, :stims, :user
    end

    list do
      filters [:is_newbie, :team, :grad_year]
      scopes [:active, :inactive, nil]
      sort_by :last_name
    end
  end

  protected
  def check_preferred_name
    if preferred_name && preferred_name.downcase == first_name.downcase
      errors.add(:preferred_name, "can't match first name")
    end
  end
end
