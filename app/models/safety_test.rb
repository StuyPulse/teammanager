class SafetyTest < ApplicationRecord
  include Seasonal
  belongs_to :student
end
