class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :student, foreign_key: true, null: false
      t.references :required_payment, foreign_key: true, null: false
      t.boolean :excused, null: false, default: false

      t.timestamps
    end
    add_index :payments, :excused
  end
end
