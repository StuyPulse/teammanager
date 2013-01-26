class AddDateToDinners < ActiveRecord::Migration
  def change
    add_column :dinners, :date, :date
  end
end
