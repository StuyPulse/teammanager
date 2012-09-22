class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_id, :integer
  end
end
