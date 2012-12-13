class AddColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :requires_medical_form, :boolean
  end
end
