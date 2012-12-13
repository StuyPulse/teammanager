class AddForeignKeyToParentPermissionForms < ActiveRecord::Migration
  def change
    add_column :parent_permission_forms, :student_id, :integer
    add_column :parent_permission_forms, :trip_id, :integer
  end
end
