class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :division, null: false
      t.integer :number, null: false

      t.timestamps null: false
    end
    add_index :teams, :name
    add_index :teams, :division
    add_index :teams, :number
  end
end
