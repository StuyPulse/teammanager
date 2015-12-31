require 'csv'

class Student < ActiveRecord::Base
  SEASONALS = [:media_consent, :medical, :safety_test, :team_due]

  belongs_to :team
  has_many :seasonals
  has_many :safety_tests
  has_many :medicals
  has_many :team_dues
  has_many :media_consents
  has_many :community_services

  before_save :format_data
  validates :first_name, :last_name, :graduation_year, :sark, :email, presence: true
  validates :osis, length: { is: 9 },
                   numericality: { greater_than: 0 },
                   allow_blank: true

  validates :sark, length: { is: 4 },
                   numericality: { greater_than: 0 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def valid_seasonal(type)
    # Ordinarily, I would just use `seasonal_type: type`, but Rails enums are
    # trolling me and returning inconsistent results.
    seasonals.valid.where(seasonal_type: Seasonal.seasonal_types[type]).first
  end

  def total_service_hours
    community_services.valid.sum(:hours)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      order(:id).each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end

  private

  def format_data
    # Remove all non-digits from phone numbers
    phone.gsub!(/\D/, '') unless phone.blank?
    parent_home_phone.gsub!(/\D/, '') unless parent_home_phone.blank?
    parent_cell_phone.gsub!(/\D/, '') unless parent_cell_phone.blank?
  end
end
