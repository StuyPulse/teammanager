class CreateTeamDues < ActiveRecord::Migration
  def change
    create_table :team_dues do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :year, null: false

      t.timestamps null: false
    end
    add_index :team_dues, :year
  end
end
