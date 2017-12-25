class Student < ApplicationRecord
  include Nameable

  has_paper_trail

  belongs_to :team, optional: true
  belongs_to :user, optional: true
  has_and_belongs_to_many :parents
  has_many :media_consents
  has_many :medicals
  has_many :safety_tests
  has_many :stims
  has_many :team_dues

  has_many :services
  has_many :events, through: :services

  scope :active, -> { where(is_active: true) }

  auto_strip_attributes :first_name, :last_name, :preferred_name, :email

  validates :first_name, :last_name, :grad_year, :osis, :email, :phone,
            presence: true, allow_blank: false
  validates :parents, presence: true
  validates :osis, length: { is: 9 },
                   numericality: { greater_than: 0,
                                   message: 'cannot be negative' }
  validate :check_preferred_name

  phony_normalize :phone, default_country_code: 'US'

  def valid_forms(type)
    case type
    when :team_dues
      team_dues.valid
    when :medicals
      medicals.valid
    when :media_consents
      media_consents.valid
    end
  end

  rails_admin do
    create do
      exclude_fields :team_dues, :media_consents, :medicals, :events, :services,
                     :safety_tests, :stims, :user
    end

    list do
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
