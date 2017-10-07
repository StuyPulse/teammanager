class AddIsNewbieFieldForStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :is_newbie, :boolean, null: false, default: true
    add_index :students, :is_newbie
  end
end
