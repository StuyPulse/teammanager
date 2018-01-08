class CreateStims < ActiveRecord::Migration[5.1]
  def change
    create_table :stims do |t|
      t.integer :year, index: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
  end
end
