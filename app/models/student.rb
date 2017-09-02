class Student < ApplicationRecord
  include Nameable

  belongs_to :team
  belongs_to :user, optional: true
  has_and_belongs_to_many :parents
  validates :first_name, :last_name, :grad_year, :osis, :email, :phone, :team_id,
            presence: true, allow_blank: false
end
