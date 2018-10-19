class ChangeStudentEmailToPersonalEmail < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :email, :personal_email
  end
end
