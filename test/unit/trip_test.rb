# == Schema Information
#
# Table name: trips
#
#  id                               :integer          not null, primary key
#  name                             :string(255)
#  start_date                       :date
#  end_date                         :date
#  requires_teacher_permission_form :boolean
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  requires_medical_form            :boolean
#  requires_trip_deposit            :boolean
#  requires_trip_fee                :boolean
#

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
