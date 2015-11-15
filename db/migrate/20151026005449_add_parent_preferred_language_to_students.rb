class AddParentPreferredLanguageToStudents < ActiveRecord::Migration
  def change
    add_column :students, :parent_preferred_language, :string
    add_index :students, :parent_preferred_language
  end
end
