class AddGenderToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :gender, :string

    add_index :students, :gender
  end
end
