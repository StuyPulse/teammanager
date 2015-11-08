class CreateMediaConsents < ActiveRecord::Migration
  def change
    create_table :media_consents do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :year, null: false

      t.timestamps null: false
    end
    add_index :media_consents, :year
  end
end
