class ChangeSafetyTestDateToYear < ActiveRecord::Migration
  def up
    remove_column :safety_tests, :date
    add_column :safety_tests, :year, :integer
  end

  def down
    remove_column :safety_tests, :year
    add_column :safety_tests, :date, :date
  end
end
