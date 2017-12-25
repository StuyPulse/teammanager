class AddIsActiveToStudents < ActiveRecord::Migration[5.1]
  def change
    change_table :students do |t|
      t.boolean :is_active, null: false, default: true
      t.index :is_active
    end
  end
end
