# == Schema Information
#
# Table name: trip_deposits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  trip_id    :integer
#

require 'test_helper'

class TripDepositTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
