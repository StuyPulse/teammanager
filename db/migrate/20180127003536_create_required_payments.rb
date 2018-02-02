class CreateRequiredPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :required_payments do |t|
      t.references :trip, foreign_key: true, null: false
      t.string :type, null: false
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
    add_index :required_payments, :type
  end
end
