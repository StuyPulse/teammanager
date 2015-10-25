class AddParentInfoToStudents < ActiveRecord::Migration
  def change
    add_column :students, :father_name, :string
    add_column :students, :mother_name, :string
    add_column :students, :parent_email, :string
    add_column :students, :parent_home_phone, :string
    add_column :students, :parent_cell_phone, :string

    add_index :students, :father_name
    add_index :students, :mother_name
    add_index :students, :parent_email
    add_index :students, :parent_home_phone
    add_index :students, :parent_cell_phone
  end
end
