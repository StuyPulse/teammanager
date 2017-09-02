class Parent < ApplicationRecord
  has_and_belongs_to_many :students
  validates :first_name, :last_name, :phone, presence: true, allow_blank: false
end
