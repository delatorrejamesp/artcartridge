class AddColumnLinkAdminAdvertisement < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_advertisements, :link, :string
  end
end
