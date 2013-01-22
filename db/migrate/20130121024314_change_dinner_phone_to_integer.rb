class ChangeDinnerPhoneToInteger < ActiveRecord::Migration
  def up
    change_column :dinners, :volunteer_phone, :integer
  end

  def down
    change_column :dinners, :volunteer_phone, :string
  end
end
