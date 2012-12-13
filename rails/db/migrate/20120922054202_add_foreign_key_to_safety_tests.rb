class AddForeignKeyToSafetyTests < ActiveRecord::Migration
  def change
    add_column :safety_tests, :student_id, :integer
  end
end
