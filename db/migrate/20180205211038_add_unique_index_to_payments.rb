class AddUniqueIndexToPayments < ActiveRecord::Migration[5.1]
  def change
    add_index :payments, [:required_payment_id, :student_id], unique: true
  end
end
