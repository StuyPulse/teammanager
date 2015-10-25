class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :graduation_year, null: false
      t.integer :osis, null: false
      t.integer :sark, null: false
      t.string :email, null: false
      t.string :phone

      t.timestamps null: false
    end
    add_index :students, :first_name
    add_index :students, :last_name
    add_index :students, :graduation_year
    add_index :students, :osis, unique: true
    add_index :students, :sark
    add_index :students, :email
    add_index :students, :phone
  end
end
