class AddStudentToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :student, foreign_key: true, unique: true
    remove_index :users, :student_id
    add_index :users, :student_id, unique: true
  end
end
