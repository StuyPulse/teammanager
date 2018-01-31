class AddIndexToExcusedTeamDue < ActiveRecord::Migration[5.1]
  def change
    add_index :team_dues, :excused
  end
end
