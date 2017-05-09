class AddColumnFeatured < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :featured, :boolean, null: false, default: false
  end
end
