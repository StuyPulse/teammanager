class AddForeignKeyToTeacherPermissionForms < ActiveRecord::Migration
  def change
    add_column :teacher_permission_forms, :student_id, :integer
    add_column :teacher_permission_forms, :trip_id, :integer
  end
end
