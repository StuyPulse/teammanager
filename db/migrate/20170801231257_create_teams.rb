class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :program, null: false
      t.integer :number, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
