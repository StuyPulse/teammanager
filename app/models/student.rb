class Student < ApplicationRecord
  include Nameable

  belongs_to :team
  belongs_to :user, optional: true
  has_and_belongs_to_many :parents
  has_many :team_dues
  has_many :media_consents
  has_many :medicals
  has_many :safety_tests
  has_many :services
  has_many :events, through: :services

  validates :first_name, :last_name, :grad_year, :osis, :email, :phone,
            :team_id, presence: true, allow_blank: false
  validates :parents, presence: true

  def valid_forms(type)
    case type
    when :team_dues
      team_dues.valid
    when :medicals
      medicals.valid
    when :media_consents
      media_consents.valid
    end
  end

  rails_admin do
    create do
      exclude_fields :team_dues, :media_consents, :medicals, :events, :services,
                     :user
    end
  end
end
