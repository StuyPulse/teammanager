class AddHasMediaConsentToStim < ActiveRecord::Migration[5.1]
  def change
    add_column :stims, :has_media_consent, :boolean,
          null: false, default: false
    add_index :stims, :has_media_consent
  end
end
