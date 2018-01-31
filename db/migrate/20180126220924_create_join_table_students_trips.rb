class CreateJoinTableStudentsTrips < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :trips do |t|
      t.index [:student_id, :trip_id]
      t.index [:trip_id, :student_id]
    end
  end
end
