class AddColumnsToTripFees < ActiveRecord::Migration
  def change
    add_column :trip_fees, :student_id, :integer
    add_column :trip_fees, :trip_id, :integer
  end
end
