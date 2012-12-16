class AddForeignKeyToTeamDues < ActiveRecord::Migration
  def change
    add_column :team_dues, :student_id, :integer
  end
end
