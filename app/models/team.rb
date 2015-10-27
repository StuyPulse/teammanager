class Team < ActiveRecord::Base
  has_many :students
  validates :name, :program, :number, presence: true
  validates :program, inclusion: {in: %w(FLL FRC FTC),
    message: "%{value} is not a FIRST program. Use FLL, FRC, or FTC."}

  def display_name
    "#{program} #{number}: #{name}"
  end
end
