class AddExcusedToTeamDue < ActiveRecord::Migration[5.1]
  def change
    add_column :team_dues, :excused, :boolean, null: false, default: false
  end
end
