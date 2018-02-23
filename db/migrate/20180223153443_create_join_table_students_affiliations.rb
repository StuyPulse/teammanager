class CreateJoinTableStudentsAffiliations < ActiveRecord::Migration[5.1]
  def change
    create_join_table :students, :affiliations do |t|
      t.index [:student_id, :affiliation_id]
      t.index [:affiliation_id, :student_id]
    end
  end
end
