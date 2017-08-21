class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :preferred_name
      t.integer :grad_year, null: false
      t.integer :osis, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.references :team, foreign_key: true, null: false

      t.timestamps
    end
    add_index :students, :first_name
    add_index :students, :last_name
    add_index :students, :preferred_name
    add_index :students, :grad_year
    add_index :students, :osis, unique: true
    add_index :students, :email, unique: true
    add_index :students, :phone
  end
end
