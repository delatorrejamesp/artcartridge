class FixAdminSetting < ActiveRecord::Migration[5.0]
  def change
    remove_column :admin_settings, :setting_id
    add_column :admin_qoutes, :setting_id, :integer
    add_index :admin_qoutes, :setting_id
  end
end
