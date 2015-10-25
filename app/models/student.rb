class Student < ActiveRecord::Base
  belongs_to :team
  validates :first_name, :last_name, :graduation_year, :osis, :sark, :email, presence: true
  validates :osis, :sark, numericality: { greater_than: 0 }
  validates :osis, length: { is: 9 }
  validates :sark, length: { is: 4 }
end
