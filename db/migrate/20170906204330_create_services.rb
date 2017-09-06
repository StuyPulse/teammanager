class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.references :student, foreign_key: true
      t.references :event, foreign_key: true
      t.float :hours

      t.timestamps
    end
  end
end
