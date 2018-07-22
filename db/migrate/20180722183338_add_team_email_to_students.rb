class AddTeamEmailToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :team_email, :string
    add_index :students, :team_email
  end
end
