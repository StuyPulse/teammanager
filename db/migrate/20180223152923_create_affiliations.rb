class CreateAffiliations < ActiveRecord::Migration[5.1]
  def change
    create_table :affiliations do |t|
      t.string :name, null: false
      t.index :name

      t.timestamps
    end
  end
end
