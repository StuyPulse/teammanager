class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone, null: false
      t.string :preferred_language

      t.timestamps
    end
    add_index :parents, :first_name
    add_index :parents, :last_name
    add_index :parents, :email
    add_index :parents, :phone
    add_index :parents, :preferred_language
  end
end
