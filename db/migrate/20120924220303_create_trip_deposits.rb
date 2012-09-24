class CreateTripDeposits < ActiveRecord::Migration
  def change
    create_table :trip_deposits do |t|

      t.timestamps
    end
  end
end
