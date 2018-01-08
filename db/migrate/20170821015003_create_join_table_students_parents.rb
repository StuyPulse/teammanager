class CreateJoinTableStudentsParents < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :parents do |t|
      t.index [:student_id, :parent_id]
      t.index [:parent_id, :student_id]
    end
  end
end
