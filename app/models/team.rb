class Team < ApplicationRecord
  has_many :students
  validates :program, :number, :name, presence: true, allow_blank: false

  def display_name
    "#{program} #{number} #{name}"
  end
end
