class Parent < ApplicationRecord
  include Nameable

  has_and_belongs_to_many :students

  validates :first_name, :last_name, :phone, presence: true, allow_blank: false
  phony_normalize :phone, default_country_code: 'US'
end
