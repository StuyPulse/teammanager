class CreateMedicals < ActiveRecord::Migration
  def change
    create_table :medicals do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :year, null: false

      t.timestamps null: false
    end
    add_index :medicals, :year
  end
end
