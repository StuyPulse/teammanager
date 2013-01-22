class AddFieldsToDinner < ActiveRecord::Migration
  def change
    add_column :dinners, :volunteer_name, :string
    add_column :dinners, :volunteer_phone, :string
    add_column :dinners, :volunteer_email, :string
    add_column :dinners, :meal_description, :string
    add_column :dinners, :notes, :string
  end
end
