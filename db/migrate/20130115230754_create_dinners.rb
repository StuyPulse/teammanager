class CreateDinners < ActiveRecord::Migration
  def change
    create_table :dinners do |t|
      t.timestamps
    end
  end
end
