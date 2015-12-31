class CreateSeasonals < ActiveRecord::Migration
  def up
    create_table :seasonals do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :year, index: true, null: false
      t.integer :seasonal_type, index: true, null: false

      t.timestamps null: false
    end

    # Convert existing Seasonal models into Seasonals, but leave the originals
    # intact.
    types = [:media_consent, :medical, :safety_test, :team_due]
    types.each do |type|
      model = type.to_s.classify.constantize
      model.find_each do |s|
        Seasonal.create!(
          student: s.student,
          year: s.year,
          seasonal_type: type,
        )
      end
    end
  end

  def down
    drop_table :seasonals
  end
end
