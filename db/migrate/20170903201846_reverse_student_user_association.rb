class ReverseStudentUserAssociation < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :student_id
    add_reference :students, :user, index: true
  end
end
