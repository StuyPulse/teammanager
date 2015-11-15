class CreateCommunityServices < ActiveRecord::Migration
  def change
    create_table :community_services do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :year, null: false
      t.string :description, null: false
      t.float :hours, null: false

      t.timestamps null: false
    end
    add_index :community_services, :year
  end
end
