class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :requires_teacher_permission_form

      t.timestamps
    end
  end
end
