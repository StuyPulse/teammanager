require 'csv'

class Student < ActiveRecord::Base
  SEASONALS = [:media_consent, :medical, :safety_test, :team_due]

  belongs_to :team
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
    try(type.to_s.pluralize).try(:valid).try(:first)
  end

  def total_service_hours
    community_services.valid.sum(:hours)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names + (SEASONALS.map {|seasonal| "#{seasonal.to_s.pluralize}?"})
      order(:id).each do |student|
        statuses_of_seasonals = (SEASONALS.map {|seasonal| student.valid_seasonal(seasonal) != nil})
        csv << student.attributes.values_at(*column_names) + statuses_of_seasonals
      end
    end
  end

  private

  def format_data
    # Normalize phone numbers
    phone.gsub!(/\D/, '') unless phone.blank?
    parent_home_phone.gsub!(/\D/, '') unless parent_home_phone.blank?
    parent_cell_phone.gsub!(/\D/, '') unless parent_cell_phone.blank?
  end
end
