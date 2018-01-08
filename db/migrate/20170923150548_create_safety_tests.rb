class CreateSafetyTests < ActiveRecord::Migration[5.1]
  def change
    create_table :safety_tests do |t|
      t.boolean :is_passed, index: true, null: false
      t.boolean :is_signed, index: true, null: false
      t.references :student, foreign_key: true, null: false
      t.integer :year, index: true, null: false

      t.timestamps
    end
  end
end
