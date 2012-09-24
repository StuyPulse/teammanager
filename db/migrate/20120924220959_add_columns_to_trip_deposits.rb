class AddColumnsToTripDeposits < ActiveRecord::Migration
  def change
    add_column :trip_deposits, :student_id, :integer
    add_column :trip_deposits, :trip_id, :integer
  end
end
