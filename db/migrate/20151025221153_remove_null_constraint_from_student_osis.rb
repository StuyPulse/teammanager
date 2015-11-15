class RemoveNullConstraintFromStudentOsis < ActiveRecord::Migration
  def change
    change_column_null :students, :osis, true
  end
end
