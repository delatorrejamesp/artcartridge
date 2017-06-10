class AddAttachmentImageToAdvertisements < ActiveRecord::Migration
  def self.up
    change_table :admin_advertisements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :admin_advertisements, :image
  end
end
