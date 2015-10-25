class Team < ActiveRecord::Base
  has_many :students
  validates :name, :division, :number, presence: true

  def display_name
    "#{division} #{number}: #{name}"
  end
end
