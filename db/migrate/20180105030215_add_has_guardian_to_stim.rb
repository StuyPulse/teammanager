class AddHasGuardianToStim < ActiveRecord::Migration[5.1]
  def change
    add_column :stims, :has_guardian, :boolean, null: false, default: false
    add_index :stims, :has_guardian
  end
end
