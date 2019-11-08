class CreateTripDismissals < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_dismissals do |t|
      t.references :trip, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
