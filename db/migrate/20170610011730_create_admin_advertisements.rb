class CreateAdminAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_advertisements do |t|
      t.string :remarks
      t.boolean :enable, default: :false
      t.timestamps
    end
  end
end
