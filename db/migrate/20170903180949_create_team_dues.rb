class CreateTeamDues < ActiveRecord::Migration[5.1]
  def change
    create_table :team_dues do |t|
      t.integer :year, null: false
      t.references :student, foreign_key: true, null: false
      t.index :year

      t.timestamps
    end
  end
end
