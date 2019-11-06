class AddImageIndexToTripDismissals < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_dismissals, :image, :string
    add_index :trip_dismissals, :image
  end
end
