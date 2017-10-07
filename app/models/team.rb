class Team < ApplicationRecord
  has_many :students

  auto_strip_attributes :name

  validates :program, :number, :name, presence: true, allow_blank: false
  validates :program, inclusion: { in: %w(FRC FTC) }

  def display_name
    "#{program} #{number} #{name}"
  end
end
