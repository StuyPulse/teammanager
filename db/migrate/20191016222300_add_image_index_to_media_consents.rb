class AddImageIndexToMediaConsents < ActiveRecord::Migration[5.2]
  def change
    add_column :media_consents, :image, :string
    add_index :media_consents, :image
  end
end
