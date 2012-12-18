class CreateTeamDues < ActiveRecord::Migration
  def change
    create_table :team_dues do |t|
      t.integer :year
      t.integer :student_id
      t.timestamps
    end
  end
end
