class CreateParentPermissionForms < ActiveRecord::Migration
  def change
    create_table :parent_permission_forms do |t|

      t.timestamps
    end
  end
end
