class AddForeignKeyToDinners < ActiveRecord::Migration
  def change
    add_column :dinners, :student_id, :integer
  end
end
