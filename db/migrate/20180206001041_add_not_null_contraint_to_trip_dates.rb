class AddNotNullContraintToTripDates < ActiveRecord::Migration[5.1]
  def change
    change_column_null :trips, :start_date, false
    change_column_null :trips, :end_date, false
  end
end
