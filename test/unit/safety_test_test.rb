# == Schema Information
#
# Table name: safety_tests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#  year       :integer
#

require 'test_helper'

class SafetyTestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
