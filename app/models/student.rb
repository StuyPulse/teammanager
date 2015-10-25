class Student < ActiveRecord::Base
  validates :first_name, :last_name, :graduation_year, :osis, :sark, :email, presence: true
  validates :osis, length: { is: 9 }
  validates :sark, length: { is: 4 }
end
