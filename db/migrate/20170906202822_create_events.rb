class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.date :date, null: false
      t.integer :valid_year, null: false
      t.float :default_hours, null: false, default: 0
      t.index :name
      t.index :date
      t.index :valid_year

      t.timestamps
    end
  end
end
