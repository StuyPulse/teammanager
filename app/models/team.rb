class Team < ActiveRecord::Base
  validates :name, :division, :number, presence: true
end
