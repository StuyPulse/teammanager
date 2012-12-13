class AddColumnsToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :requires_trip_deposit, :boolean
    add_column :trips, :requires_trip_fee, :boolean
  end
end
