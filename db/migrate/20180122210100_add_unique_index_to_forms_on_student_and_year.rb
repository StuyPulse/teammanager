class AddUniqueIndexToFormsOnStudentAndYear < ActiveRecord::Migration[5.1]
  def change
    add_index :media_consents, [:year, :student_id], unique: true
    add_index :safety_tests, [:year, :student_id], unique: true
    add_index :stims, [:year, :student_id], unique: true
    add_index :team_dues, [:year, :student_id], unique: true
  end
end
