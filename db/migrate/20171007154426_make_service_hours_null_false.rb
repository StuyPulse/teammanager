class MakeServiceHoursNullFalse < ActiveRecord::Migration[5.1]
  def change
    change_column_null :services, :hours, false
  end
end
