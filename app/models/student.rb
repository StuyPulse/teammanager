class Student < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_and_belongs_to_many :parents

  def full_name
    "#{first_name} #{last_name}"
  end
end
