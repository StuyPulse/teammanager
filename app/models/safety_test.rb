class SafetyTest < ActiveRecord::Base
  belongs_to :student

  scope :valid, -> { where(year: current_season_year) }

  private

  def self.current_season_year
    month = Time.now.month
    year = Time.now.year

    month < 9 ? year - 1 : year
  end
end
