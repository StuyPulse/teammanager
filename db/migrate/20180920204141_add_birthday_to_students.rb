class AddBirthdayToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :birthday, :string
    add_index :students, :birthday
  end
end
