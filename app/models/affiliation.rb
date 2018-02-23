class Affiliation < ApplicationRecord
  has_and_belongs_to_many :students

  validates :name, presence: true, allow_blank: false
end
