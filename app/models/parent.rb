class Parent < ApplicationRecord
  include Nameable

  has_and_belongs_to_many :students

  auto_strip_attributes :first_name, :last_name, :email, :preferred_language

  validates :first_name, :last_name, :phone, presence: true, allow_blank: false
  phony_normalize :phone, default_country_code: 'US'
end
