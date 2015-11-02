class Student < ActiveRecord::Base
  SEASONALS = [SafetyTest]

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

  def valid_seasonal(type)
    try(type.name.underscore.pluralize.to_sym).valid.first
  end

  private

  def format_data
    # Normalize phone numbers
    phone.gsub!(/\D/, '') unless phone.blank?
    parent_home_phone.gsub!(/\D/, '') unless parent_home_phone.blank?
    parent_cell_phone.gsub!(/\D/, '') unless parent_cell_phone.blank?
  end
end
