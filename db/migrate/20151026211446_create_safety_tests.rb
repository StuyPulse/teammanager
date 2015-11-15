class CreateSafetyTests < ActiveRecord::Migration
  def change
    create_table :safety_tests do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :year

      t.timestamps null: false
    end
    add_index :safety_tests, :year
  end
end
