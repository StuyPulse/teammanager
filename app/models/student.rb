class Student < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_and_belongs_to_many :parents
  validates :first_name, :last_name, :grad_year, :osis, :email, :phone, :team_id,
            presence: true, allow_blank: false

  def full_name
    "#{first_name} #{last_name}"
  end
end
