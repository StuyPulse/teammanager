class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.boolean :requires_teacher_permission, null: false, default: false

      t.timestamps
    end
    add_index :trips, :name
  end
end
