class Team < ApplicationRecord
  has_many :students

  def display_name
    "#{program} #{number} #{name}"
  end
end
