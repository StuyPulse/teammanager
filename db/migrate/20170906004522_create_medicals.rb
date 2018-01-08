class CreateMedicals < ActiveRecord::Migration[5.1]
  def change
    create_table :medicals do |t|
      t.date :date, null: false
      t.references :student, foreign_key: true
      t.index :date

      t.timestamps
    end
    change_column_null :medicals, :student_id, false
  end
end
