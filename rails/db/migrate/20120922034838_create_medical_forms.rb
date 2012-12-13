class CreateMedicalForms < ActiveRecord::Migration
  def change
    create_table :medical_forms do |t|
      t.date :date

      t.timestamps
    end
  end
end
