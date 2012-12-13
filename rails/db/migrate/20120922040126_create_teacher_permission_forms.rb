class CreateTeacherPermissionForms < ActiveRecord::Migration
  def change
    create_table :teacher_permission_forms do |t|

      t.timestamps
    end
  end
end
