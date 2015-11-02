class SafetyTest < ActiveRecord::Base
  include Seasonal

  belongs_to :student
end
