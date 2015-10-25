class Team < ActiveRecord::Base
  has_many :students
  validates :name, :division, :number, presence: true
end
