class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :year
      t.integer :id
      t.string :student_email
      t.integer :student_cell_phone
      t.string :mother_name
      t.string :father_name
      t.string :preferred_language
      t.string :parent_email
      t.integer :parent_home_phone
      t.integer :parent_cell_phone

      t.timestamps
    end
  end
end
