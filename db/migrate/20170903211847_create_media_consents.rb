class CreateMediaConsents < ActiveRecord::Migration[5.1]
  def change
    create_table :media_consents do |t|
      t.integer :year, null: false
      t.references :student, foreign_key: true, null: false
      t.index :year

      t.timestamps
    end
  end
end
