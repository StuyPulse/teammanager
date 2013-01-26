# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  year               :integer
#  student_email      :string(255)
#  student_cell_phone :string(255)
#  mother_name        :string(255)
#  father_name        :string(255)
#  preferred_language :string(255)
#  parent_email       :string(255)
#  parent_home_phone  :string(255)
#  parent_cell_phone  :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  student_id         :integer
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
