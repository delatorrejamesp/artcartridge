class AddAttachmentLogoToAdminSettings < ActiveRecord::Migration
  def self.up
    change_table :admin_settings do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :admin_settings, :logo
  end
end
