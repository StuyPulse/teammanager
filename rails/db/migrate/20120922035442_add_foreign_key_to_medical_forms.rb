class AddForeignKeyToMedicalForms < ActiveRecord::Migration
  def change
    add_column :medical_forms, :student_id, :integer
  end
end
