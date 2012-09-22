class CreateSafetyTests < ActiveRecord::Migration
  def change
    create_table :safety_tests do |t|
      t.date :date

      t.timestamps
    end
  end
end
