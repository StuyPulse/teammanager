class ChangePhoneNumbersToStrings < ActiveRecord::Migration
  def up
    change_column :students, :student_cell_phone, :string
    change_column :students, :parent_home_phone, :string
    change_column :students, :parent_cell_phone, :string
  end

  def down
    change_column :students, :student_cell_phone, :integer
    change_column :students, :parent_home_phone, :integer
    change_column :students, :parent_cell_phone, :integer
  end
end
