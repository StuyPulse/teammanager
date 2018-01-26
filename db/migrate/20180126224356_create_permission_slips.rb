class CreatePermissionSlips < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_slips do |t|
      t.string :type, null: false
      t.references :trip, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false

      t.timestamps
    end
    add_index :permission_slips, :type
  end
end
