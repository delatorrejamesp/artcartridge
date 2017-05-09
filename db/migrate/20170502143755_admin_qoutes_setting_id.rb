class AdminQoutesSettingId < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_settings, :setting_id, :integer
    add_index :admin_settings, :setting_id
  end
end
