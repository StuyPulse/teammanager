class AddNotNullToSafetyTests < ActiveRecord::Migration
  def change
    change_column_null :safety_tests, :student_id, true
    change_column_null :safety_tests, :year, true
  end
end
