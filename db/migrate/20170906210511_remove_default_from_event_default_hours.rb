class RemoveDefaultFromEventDefaultHours < ActiveRecord::Migration[5.1]
  def change
    change_column_default :events, :default_hours, nil
  end
end
