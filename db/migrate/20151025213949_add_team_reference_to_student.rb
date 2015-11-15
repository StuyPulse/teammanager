class AddTeamReferenceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :team_id, :integer
    add_index :students, :team_id
  end
end
