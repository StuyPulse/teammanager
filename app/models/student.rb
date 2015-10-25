class Student < ActiveRecord::Base
  belongs_to :team
  before_save :format_data
  validates :first_name, :last_name, :graduation_year, :sark, :email, presence: true
  validates :osis, length: { is: 9 },
                   numericality: { greater_than: 0 },
                   allow_blank: true

  validates :sark, length: { is: 4 },
                   numericality: { greater_than: 0 }

  private

  def format_data
    # Normalize phone numbers
    phone.gsub!(/\D/, '')
    parent_home_phone.gsub!(/\D/, '')
    parent_cell_phone.gsub!(/\D/, '')
  end
end
