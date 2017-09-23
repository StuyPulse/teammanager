class AllowStudentsTeamToBeNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :students, :team_id, true
  end
end
