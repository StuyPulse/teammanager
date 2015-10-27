class ChangeTeamDivisionToProgram < ActiveRecord::Migration
  def change
    rename_column :teams, :division, :program
  end
end
