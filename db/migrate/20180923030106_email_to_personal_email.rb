class EmailToPersonalEmail < ActiveRecord::Migration[5.1]
  def change
    change_table :students do |t|
      t.rename :email, :personal_email
    end
  end
end
