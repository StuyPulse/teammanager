class CreateTripFees < ActiveRecord::Migration
  def change
    create_table :trip_fees do |t|

      t.timestamps
    end
  end
end
