class AddUniqueConstraintOnPermissionSlip < ActiveRecord::Migration[5.1]
  def change
    add_index :permission_slips, [:trip_id, :type, :student_id], unique: true
  end
end
