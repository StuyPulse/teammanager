class Student < ActiveRecord::Base
  belongs_to :team
  has_many :safety_tests
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

  def has_valid_safety_test?
    year = current_season_year
    safety_tests.where(year: year).any?
  end

  def current_season_year
    month = Time.now.month
    year = Time.now.year

    month < 9 ? year - 1 : year
  end

  private

  def format_data
    # Normalize phone numbers
    phone.gsub!(/\D/, '') unless phone.blank?
    parent_home_phone.gsub!(/\D/, '') unless parent_home_phone.blank?
    parent_cell_phone.gsub!(/\D/, '') unless parent_cell_phone.blank?
  end
end
